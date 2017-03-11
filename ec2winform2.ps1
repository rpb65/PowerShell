Param(
    [string]$Region = "us-west-2",
    [string]$AvailibilityZone = "us-west-2a",
    [string]$Vpc = "vpc-f3e23496",
    [string]$SubnetId = "subnet-ae8555d9",
    [string]$InstanceType = "t2.micro",
    [array]$SecurityGroupIds = "sg-9e3a7cfb",
    [Parameter(Mandatory=$true)]
    [String]$Name,
    #[string]$Name = "auto_$([int](Get-Date -UFormat "%s"))",
    [string]$KeyName = "$Name.pem",
    [string]$AmiName = "WINDOWS_2012R2_BASE",
    [Parameter(Mandatory=$true)]
    [string]$Owner,
    #[string]$Owner = "_adm/solarch",
    [Parameter(Mandatory=$true)]
    [string]$TechContact,
    #[string]$TechContact = "rmcdermo@fredhutch.org,
    [Parameter(Mandatory=$true)]
    [string]$BillingContact,
    #[string]$BillingContact = "cloudops@fredhutch.org",
    [string]$Description = "Provisioned by $([Environment]::UserDomainName)\$([Environment]::UserName) On: $(Get-Date)",
    [string]$BusinessHours = "?",
    [string]$GrantCritical = "?",
    [string]$Phi = "?",
    [string]$Pii = "?",
    [string]$PubliclyAccessible = "?",
    [string]$Password = "Password123!",
    [string]$RootVolSize = "50",
    [string]$RootVolDelOnTerminate = "true",
    [string]$RootVolType = "gp2", #'gp2' for GP SSD, 'io1' for provisioned iops (also requires -Iops parameter), "standard" for magenetic disks
    [string]$DataVolSize = $False,
    [string]$DataVolDelOnTerminate = "true",
    [string]$DataVolType = "gp2" #'gp2' for GP SSD, 'io1' for provisioned iops (also requires -Iops parameter), "standard" for magenetic disks
     
)

function button ($title,$hostname, $hostowner, $hostdepartment) {

###################Load Assembly for creating form & button######

[void][System.Reflection.Assembly]::LoadWithPartialName( “System.Windows.Forms”)
[void][System.Reflection.Assembly]::LoadWithPartialName( “Microsoft.VisualBasic”)

#####Define the form size & placement

$form = New-Object “System.Windows.Forms.Form”;
$form.Width = 500;
$form.Height = 150;
$form.Text = $title;
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;

##############Define text host name
$textLabel1 = New-Object “System.Windows.Forms.Label”;
$textLabel1.Left = 25;
$textLabel1.Top = 15;

$textLabel1.Text = $hostname;

##############Define text owner

$textLabel2 = New-Object “System.Windows.Forms.Label”;
$textLabel2.Left = 25;
$textLabel2.Top = 50;

$textLabel2.Text = $hostowner;

##############Define text department

$textLabel3 = New-Object “System.Windows.Forms.Label”;
$textLabel3.Left = 25;
$textLabel3.Top = 85;

$textLabel3.Text = $hostdepartment;

############Define text box1 for input
$textBox1 = New-Object “System.Windows.Forms.TextBox”;
$textBox1.Left = 150;
$textBox1.Top = 10;
$textBox1.width = 200;

############Define text box2 for input

$textBox2 = New-Object “System.Windows.Forms.TextBox”;
$textBox2.Left = 150;
$textBox2.Top = 50;
$textBox2.width = 200;

############Define text box3 for input

$textBox3 = New-Object “System.Windows.Forms.TextBox”;
$textBox3.Left = 150;
$textBox3.Top = 90;
$textBox3.width = 200;

#############Define default values for the input boxes
$defaultValue = “”
$textBox1.Text = $defaultValue;
$textBox2.Text = $defaultValue;
$textBox3.Text = $defaultValue;

#############define OK button
$button = New-Object “System.Windows.Forms.Button”;
$button.Left = 360;
$button.Top = 85;
$button.Width = 100;
$button.Text = “Ok”;

############# This is when you have to close the form after getting values
$eventHandler = [System.EventHandler]{
$textBox1.Text;
$textBox2.Text;
$textBox3.Text;
$form.Close();};

$button.Add_Click($eventHandler) ;

#############Add controls to all the above objects defined
$form.Controls.Add($button);
$form.Controls.Add($textLabel1);
$form.Controls.Add($textLabel2);
$form.Controls.Add($textLabel3);
$form.Controls.Add($textBox1);
$form.Controls.Add($textBox2);
$form.Controls.Add($textBox3);
$ret = $form.ShowDialog();

#################return values

return $textBox1.Text, $textBox2.Text, $textBox3.Text
}

$return= button “EC2 Server Request Form - Windows” “Host name” “Owner” “Department”

##################set variables
$hname,$howner,$hdept = $return