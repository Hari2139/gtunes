<%@ page contentType="text/plain" %>
Dear ${user.firstName} ${user.lastName},
Congratulations! You have registered with gTunes.

Your login id is: ${user.login}
You can use the following link to login: <g:createLink contoller="store" absolute="true"/>

Kind Regards,
The gTunes team.
