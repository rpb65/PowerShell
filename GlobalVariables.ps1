# You can change the following defaults by altering the below settings:
#


# Set the following to true to enable the setup wizard for first time run
$SetupWizard = $False


# Start of Settings
# Please Specify the IP address or Hostname of the server to connect to
$Server = "vcolo-center"
# Would you like the report displayed in the local browser once completed ?
$DisplaytoScreen = No
# Use the following item to define if an email report should be sent once completed
$SendEmail = True
# Please Specify the SMTP server address
$SMTPSRV = "mail.fhcrc.org"
# Would you like to use SSL to send email?
$EmailSSL = False
# Please specify the email address who will send the vCheck report
$EmailFrom = "rbawaan@fhcrc.org"
# Please specify the email address(es) who will receive the vCheck report (separate multiple addresses with comma)
$EmailTo = "rbawaan@fhcrc.org"
# Please specify the email address(es) who will be CCd to receive the vCheck report (separate multiple addresses with comma)
$EmailCc = "rbawaan@gmail.com"
# Please specify an email subject
$EmailSubject = "vcolo-center vCheck Report"
# Send the report by e-mail even if it is empty?
$EmailReportEvenIfEmpty = True
# If you would prefer the HTML file as an attachment then enable the following:
$SendAttachment = True
# Set the style template to use.
$Style = "VMware"
# Set the following setting to $true to see how long each Plugin takes to run as part of the report
$TimeToRun = $true
# Report an plugins that take longer than the following amount of seconds
$PluginSeconds = 30
# End of Settings

# End of Global Variables
