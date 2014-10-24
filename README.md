UnderWriter-Car-Insurance
=========================
Type "thin start -p 3001 --ssl" in command line and  server on port 3001 will be started.
Then Underwriter webpage can be accessed in "https://127.0.0.1:3001/". 
Of course this page will be used for admin access (email "admin@abv.bg" with password "taliesin")  
but can be used and for user access as well ( users will use broker website instead)

A prototype system to be used by customers for requesting quotations for a car insurance
policy.
As the system is a prototype, the architecture is quite simple: the main components are the
customer, a web application that acts as an online insurance broker, and a single insurance
underwriter application. The user interacts with the online broker through HTTPS in order to
ensure the security of the data transfer. HTTPS is not used between the broker application and
underwriter application.
The online broker has been written using PHP + HTML5 + JAVASCRIPT/AJAX, and it
communicates with the insurance underwriter application via the REST protocol. The
underwriter application has been developed upon Ruby on Rails. All the technologies used,
high-level architecture, design solutions and diagrams as well as testing strategy and
evaluation of results for both applications are presented in the respective sections.
