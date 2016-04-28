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
<ol>
<ul><p>Navigate to <b>Setup | Create | Apps</b></p></ul>
<ul><p>Scroll down to <b>Connected Apps</b> and click <b>New</b></p></ul>
<ul><p>Give your app a name, for example - Heroku IdP App</p></ul>
<ul><p>Enter your email address</p></ul>
<ul><p>Optionally set a logo, icon and provide a description for the app </p></ul>
<ul><p>Scroll down to Web App Settings and check the <b>Enable SAML</b> checkbox</p></ul>
<ul><p>Provide the following as the <b>Start Url</b>: <%= url %> </p></ul>
<ul><p>Provide the following as the <b>Entity Id</b>: <%= url %> </p></ul>
<ul><p>Provide the following as the <b>ACS URL</b>: <%= url %> </p></ul>
<ul><p>Click Save</p></ul>
<ul><p>You should now see the details of the connected app</p></ul>
</ol>

<h2><li>Let's make sure your users can access the connected app</li></h2>
<ol>
<ul><p>Click on the 'Manage' button on the detail page of the connected app</p></ul>
<ul><p>In the Profiles section, click Manage Profiles</p></ul>
<ul><p>Select the System Administrator, Salesforce Platform User and Standard user profiles</p></ul>
<ul><p>Click Save</p></ul>
</ol>


<h2><li>Now, let's configure SAML for the Heroku App:</li></h2>
<ol>
<ul><p>If you aren't already, go to the Connected App detail page by going to <b>Manage Apps | Connected App | <i>App Name</i></b></p></ul>
<ul><p>Copy the <b>Metadata Disovery Endpoint</b> URL under the <b>SAML Login Information</b> section</p></ul>
<ul><p>Now go to your Heroku Dashboard and click on the app you deployed</p></ul>
<ul><p>On the next page, click on 'Settings' and click on the <b>Reveal Config Vars</b></p></ul>
<ul><p>Add a new config variable with the KEY as <b>SAML_METADATA</b> and the VALUE as the <b>Metada Discovery Endpoint</b> URL you copied earlier</p></ul>
<ul><p>Click Add</p></ul>
<ul><p><a href="javascript:window.location.reload(true)">Refresh this page</a> and you should be redirected to the login page of your Salesforce org</p></ul>
<img src="/img/Heroku_Config.jpg">
<ul><p>Enter your credentials and you will be redirected to the Heroku web app where you will see your user details</p></ul>
<img src="/img/Heroku_details.jpg">
</ol>
</body>
</html>