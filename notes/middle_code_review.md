# Drawbacks according middle code-review

The marked items are fixed.
 ### Non-code
 ____
 - [X] Create README file according Oleg's recommendations (e-mail)
 - [X] Set up .gitignore (The .idea folder mustn't reside in the repository)
 - [X] Separate the main Aveng project and the Spittr educational projects
 - [X] Fix IDE (Integrated development environment) warnings
 List:
 - {fixed} Class is a raw type. References to generic type Class<T> should be parameterized              SpittleController.java                /spittr/src/main/java/edu/sam/spittr/controller line 70   Java Problem
 - {fixed} The method setId(long) from the type SpittleDTO is never used locally     SpittleDTO.java                /spittr/src/main/java/edu/sam/spittr/dto            line 39   Java Problem
 - {fixed} The type WebMvcConfigurerAdapter is deprecated         WebConfig.java /spittr/src/main/java/edu/sam/aveng/config                line 23   Java Problem
 - {fixed} The type WebMvcConfigurerAdapter is deprecated         WebConfig.java /spittr/src/main/java/edu/sam/aveng/config                line 36   Java Problem
 - {will be used in future} The value of the field CardMapping.frequency is not used             CardMapping.java                /spittr/src/main/java/edu/sam/aveng/domain   line 11   Java Problem
 - {fixed} The value of the local variable test is not used     InitialController.java                /spittr/src/main/java/edu/sam/aveng/controller              line 28   Java Problem
 - [X] Apply check-style for the main project
 - [X] Sort out comments
    - [X] Delete those that are non-required
    - [X] Reform the rest in javadoc
 ____
 ### Configuration
 ___
 - [X] Use the common version for all Spring components
 - [X] Leave a single database connection configuration (WebConfig + properties file)
 - [X] Move configuration values in properties file
    - [X] db connection configuration
 ```java
    // WRONG!
    resolver.setPrefix("/WEB-INF/views/");
    resolver.setSuffix(".jsp");
 ```
 - [X] Create file with test properties (path: src/test/resources)
     - [X] Set up H2 in-memory db connection for integration tests (jdbc:h2:mem)
 ___
 ### View
 ___
 - [X] Configure page encoding (Test it on Russian language)
 
| ID      | Содержимое    | Тип   | Определение      |
| --------|:-------------:|:-----:| ----------------:|
| 2       | Ð¢ÐµÑÑ,      | NOUN  | Ñ‚ÐµÑÑ‚Ð¾Ð²Ð¾Ðµ |

 - [ ] Set up a tool to check POST request and hidden problems on user side
    - [ ] Fix hidden 404 favicon.ico exception
 - [X] Settle global page structure
    - [X] Add header with menu items
    - [X] Add footer
 ___
 ### Others
 ___
 - [ ] Localize enums

 ```java
    //  forbidden import
    import javax.persistence.*;
 ```
 - [ ] Fix the authorisation drawbacks
    - [ ] Replace default login page with custom
    - [ ] Let know users whether their registration has been successful
- [ ] Fix exceptions of db schema creation occurred on app startup

 Example
 
 Caused by: org.h2.jdbc.JdbcSQLSyntaxErrorException: Constraint "FKHI46VU7680Y1HWVMNNUH4CYBX" already exists; SQL statement:
 alter table user_authority add constraint FKhi46vu7680y1hwvmnnuh4cybx foreign key (user_id) references users [90045-199]

- [ ] Code in the master and develop branches have to be stable
 ___
