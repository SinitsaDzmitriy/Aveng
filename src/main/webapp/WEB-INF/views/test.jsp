<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8" %>


<html>

<head>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>

    </style>

    <title>Test</title>

</head>

<body>

<div class="fluid-container">
    <div class="row">

        <div class="col"></div>

        <div class="col-10">

            <div class="row mt-1">
                <button type="button" class="btn btn-primary btn-block">Back to homepage</button>
            </div>

            <div class="row mt-1">
                <div class="input-group">
                    <input id="searchInput" class="form-control" type="text" placeholder="Enter word or phrase">
                    <div class="input-group-append">
                        <button id="performSearchBtn" class="btn btn-primary" type="button">Search</button>
                    </div>
                </div>
            </div>

            <div class="row mt-1">

                <div class="col-6">
                    <div class="fluid-container">

                        <div class="row">
                            <div id="likeStatisticsWrapper" class="col d-flex" style="min-height: 48px">

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                    <table id="likeTable" class="table table-bordered">

                                        <caption>
                                            Results of search on LIKEs
                                        </caption>

                                        <thead class="d-block w-100 wr-2">

                                        <tr class="table-primary d-flex">
                                            <th scope="col" style="width: 120px;">#</th>
                                            <th scope="col" class="w-100">Content</th>
                                        </tr>

                                        </thead>

                                        <tbody id="likeTableBody" class="d-block w-100 wr-2" style="max-height: 680px; overflow-x: hidden; overflow-y: auto;">

                                        <tr class="d-flex">
                                            <th scope="row" style="width: 120px;">0</th>
                                            <td class="w-100">Sample in the LIKE search table.</td>
                                        </tr>

                                        </tbody>

                                    </table>

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-6">
                    <div class="fluid-container">

                        <div class="row">
                            <div id="fullTextStatisticsWrapper" class="col d-flex" style="min-height: 48px">

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <table id="fullTextTable" class="table table-bordered">

                                    <caption>
                                        Results of Full-Text Search
                                    </caption>

                                    <thead class="d-block w-100 wr-2">

                                    <tr class="table-primary d-flex">
                                        <th scope="col" style="width: 120px;">#</th>
                                        <th scope="col" class="w-100">Content</th>
                                    </tr>

                                    </thead>

                                    <tbody id="fullTextTableBody" class="d-block w-100 wr-2" style="max-height: 680px; overflow-x: hidden; overflow-y: auto;">

                                    <tr class="d-flex">
                                        <th scope="row" style="width: 120px;">0</th>
                                        <td class="w-100">Sample in the Full-Text Search table.</td>
                                    </tr>

                                    </tbody>

                                </table>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>

        <div class="col"></div>

    </div>
</div>

</body>

</html>

<!-- jQuery, Popper.js, Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

    $(document).ready(function () {

        var searchInputId = "#searchInput";
        var performSearchBtnId = "#performSearchBtn";

        var likeStatisticsWrapperId = "#likeStatisticsWrapper";
        var likeTableBodyId = "#likeTableBody";

        var fullTextStatisticsWrapperId = "#fullTextStatisticsWrapper";
        var fullTextTableBodyId = "#fullTextTableBody";

        $(performSearchBtnId).click(function () {

            var searchInputVal = $(searchInputId).val();

            if (searchInputVal) {

                // LIKE search request

                $.ajax({
                    type: "GET",
                    url: location.origin + "/api/test/samples/search/like?searchQuery=" + searchInputVal,
                    dataType: "json"
                })
                    .done(function(response) {

                        console.log(response);

                        var sample = response.samples;

                        $(likeStatisticsWrapperId).empty();
                        $(likeTableBodyId).empty();

                        var likeStatistics = $("<div class='alert alert-primary m-0'>"
                            + "<p>" + samples.length + " results (" + response.time + " seconds)" + "</p>"
                            + "</div>");

                        $(likeStatisticsWrapperId).append(likeStatistics);

                        var tableEntry;

                        for (var i = 0; i < samples.length; i++) {

                            tableEntry = $("<tr class='d-flex'>"
                                + "<th scope='row' style='width: 120px;'>" + samples[i].id + "</th>"
                                + "<td class='w-100'>" + samples[i].content + "</td>"
                                + "</tr>");

                            $(likeTableBodyId).append(tableEntry);

                            console.log("LIKE: OK!")

                        }

                    })
                    .fail(function () {
                        console.log("LIKE: Error is occurred!")
                    });

                // Full text search requesr

                $.ajax({
                    type: "GET",
                    url: location.origin + "/api/test/samples/search/full-text?searchQuery=" + searchInputVal,
                    dataType: "json"
                })
                    .done(function(response) {

                        console.log(response);

                        var sample = response.samples;

                        $(fullTextStatisticsWrapperId).empty();
                        $(fullTextTableBodyId).empty();

                        var fullTextStatistics = $("<div class='alert alert-primary'>"
                            + "<p>" + samples.length + " results (" + response.time + " seconds)" + "</p>"
                            + "</div>");

                        $(fullTextStatisticsWrapperId).append(fullTextStatistics);

                        var tableEntry;

                        for (var i = 0; i < samples.length; i++) {

                            tableEntry = $("<tr class='d-flex'>"
                                + "<th scope='row' style='width: 120px;'>" + samples[i].id + "</th>"
                                + "<td class='w-100'>" + samples[i].content + "</td>"
                                + "</tr>");

                            $(fullTextTableBodyId).append(tableEntry);

                            console.log("Full text: OK!")

                        }

                    })
                    .fail(function () {
                        console.log("Full text: Error is occurred!")
                    });

            }

        });

    });

</script>