package edu.sam.aveng.base.controller;

import edu.sam.aveng.base.model.transfer.UserCredentials;
import edu.sam.aveng.base.service.user.IUserService;
import edu.sam.aveng.base.util.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @GetMapping("/register")
    public String displayUserRegistrationForm(Model model) {

        LOGGER.info("User registration form displaying.");
        LOGGER.debug("Initial state of params: model={}", model);

        model.addAttribute(Constants.Model.USER_CREDENTIALS_KEY, new UserCredentials());

        LOGGER.debug("Final state of params: model={}", model);
        LOGGER.debug("View name to render: viewName=\"{}\"", Constants.View.USER_REG_FORM);

        return Constants.View.USER_REG_FORM;
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute(Constants.Model.USER_CREDENTIALS_KEY)
            UserCredentials userCredentials, Errors errors) {
        String view;
        if (errors.hasErrors()) {
            view = Constants.View.USER_REG_FORM;
        } else {
            view = Constants.View.USER_REG_SUCCESS;
            userService.create(userCredentials);
        }
        return view;
    }

    @GetMapping("/users/activation")
    public String activate(@RequestParam String token, Model model) {

        String userEmail = userService.activate(token);

        if (userEmail == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }

        model.addAttribute(Constants.Model.USER_EMAIL_KEY, userEmail);
        return Constants.View.USER_REG_ACTIVATION;

    }

}
