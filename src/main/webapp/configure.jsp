<%
	String url = (String)request.getAttribute("URL");
	String app = (String)request.getAttribute("app");
%>

<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<h1>Whoops!</h1>

It doesn't look like you've configured SAML quite yet....please follow these steps:

<ol>

<h2><li>Go to your Salesforce org, and create a Connected App:</li></h2>
<p>Navigate to <b>Setup | Create | Apps</b></p>
<p>Scroll down to <b>Connected Apps</b> and click <b>New</b></p>
<p>Give your app a name, for example - Heroku IdP App</p>
<p>Enter your email address</p>
<p>Optionally set a logo, icon and provide a description for the app </p>
<p>Scroll down to Web App Settings and check the <b>Enable SAML</b> checkbox</p>
<p>Provide the following as the <b>Start Url</b>: <%= url %> </p>
<p>Provide the following as the <b>Entity Id</b>: <%= url %> </p>
<p>Provide the following as the <b>ACS URL</b>: <%= url %> </p>
<p>Click Save</p>
<p>You should now see the details of the connected app</p>

<h2><li>Let's make sure your users can access the connected app</li></h2>
<p>Click on the 'Manage' button on the detail page of the connected app</p>
<p>In the Profiles section, click Manage Profiles</p>
<p>Select the System Administrator, Salesforce Platform User and Standard user profiles</p>
<p>Click Save</p>


<h2><li>Now, let's configure SAML for the Heroku App:</li></h2>
<p>If you aren't already, go to the Connected App detail page by going to <b>Manage Apps | Connected App | <i>App Name</i></b></p>
<p>Copy the <b>Metadata Disovery Endpoint</b> URL under the <b>SAML Login Information</b> section</p>
<p>Now go to your Heroku Dashboard and click on the app you deployed</p>
<p>On the next page, click on 'Settings' and click on the <b>Reveal Config Vars</b></p>
<p>Add a new config variable with the KEY as <b>SAML_METADATA</b> and the VALUE as the <b>Metada Discovery Endpoint</b> URL you copied earlier</p>
<p>Click Add</p>
<p><a href="javascript:window.location.reload(true)">Refresh this page</a> and you should be redirected to the login page of your Salesforce org</p>
<img src="/img/Heroku_Config.jpg">
<p>Enter your credentials and you will be redirected to the Heroku web app where you will see your user details</p>
<img src="/img/Heroku_details.jpg">
</body>
</html>