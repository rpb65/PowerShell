function button ($title,$Name, $Owner, $TechContact, $BillingContact, $Password, $RootVolSize, $Phi, $Pii) {

###################Load Assembly for creating form & button######

[void][System.Reflection.Assembly]::LoadWithPartialName( “System.Windows.Forms”)
[void][System.Reflection.Assembly]::LoadWithPartialName( “Microsoft.VisualBasic”)

#####Define the form size & placement

$form = New-Object “System.Windows.Forms.Form”;
$form.Width = 600;
$form.Height = 335;
$form.Text = $title;
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;

##############Define text host name
$textLabel1 = New-Object “System.Windows.Forms.Label”;
$textLabel1.Left = 25;
$textLabel1.Top = 15;
$textLabel1.width = 195;

$textLabel1.Text = $Name;

##############Define text owner

$textLabel2 = New-Object “System.Windows.Forms.Label”;
$textLabel2.Left = 25;
$textLabel2.Top = 50;
$textLabel2.width = 195;

$textLabel2.Text = $Owner;

##############Define text technical contact

$textLabel3 = New-Object “System.Windows.Forms.Label”;
$textLabel3.Left = 25;
$textLabel3.Top = 85;
$textLabel3.width = 195;

$textLabel3.Text = $TechContact;

##############Define text billing contact

$textLabel4 = New-Object “System.Windows.Forms.Label”;
$textLabel4.Left = 25;
$textLabel4.Top = 120;
$textLabel4.width = 195;

$textLabel4.Text = $BillingContact;


##############Define text password

$textLabel5 = New-Object “System.Windows.Forms.Label”;
$textLabel5.Left = 25;
$textLabel5.Top = 155;
$textLabel5.width = 195;

$textLabel5.Text = $Password;

##############Define text rootvolsize

$textLabel6 = New-Object “System.Windows.Forms.Label”;
$textLabel6.Left = 25;
$textLabel6.Top = 190;
$textLabel6.width = 195;

$textLabel6.Text = $RootVolSize;

##############Define text phi
$textLabel7 = New-Object “System.Windows.Forms.Label”;
$textLabel7.Left = 25;
$textLabel7.Top = 225;
$textLabel7.width = 195;

$textLabel7.Text = $Phi;

##############Define text pii
$textLabel8 = New-Object “System.Windows.Forms.Label”;
$textLabel8.Left = 25;
$textLabel8.Top = 260;
$textLabel8.width = 195;

$textLabel8.Text = $Pii;

############Define text box1 for host name
$textBox1 = New-Object “System.Windows.Forms.TextBox”;
$textBox1.Left = 225;
$textBox1.Top = 15;
$textBox1.width = 130;

############Define text box2 for owner

$textBox2 = New-Object “System.Windows.Forms.TextBox”;
$textBox2.Left = 225;
$textBox2.Top = 50;
$textBox2.width = 130;

############Define text box3 for technical contact

$textBox3 = New-Object “System.Windows.Forms.TextBox”;
$textBox3.Left = 225;
$textBox3.Top = 85;
$textBox3.width = 130;

############Define text box4 for business contact

$textBox4 = New-Object “System.Windows.Forms.TextBox”;
$textBox4.Left = 225;
$textBox4.Top = 120;
$textBox4.width = 130;

############Define text box5 for password

$textBox5 = New-Object “System.Windows.Forms.TextBox”;
$textBox5.Left = 225;
$textBox5.Top = 155;
$textBox5.width = 130;

############Define text box5 for rootvolsize

$textBox6 = New-Object “System.Windows.Forms.TextBox”;
$textBox6.Left = 225;
$textBox6.Top = 190;
$textBox6.width = 130;

############Define text box5 for phi

$textBox7 = New-Object “System.Windows.Forms.TextBox”;
$textBox7.Left = 225;
$textBox7.Top = 225;
$textBox7.width = 130;

############Define text box5 for pii

$textBox8 = New-Object “System.Windows.Forms.TextBox”;
$textBox8.Left = 225;
$textBox8.Top = 260;
$textBox8.width = 130;

#############Define default values for the input boxes
$defaultValue = “”
$textBox1.Text = $defaultValue;
$textBox2.Text = $defaultValue;
$textBox3.Text = $defaultValue;
$textBox4.Text = $defaultValue;
$textBox5.Text = $defaultValue;
$textBox6.Text = $defaultValue;
$textBox7.Text = $defaultValue;
$textBox8.Text = $defaultValue;

#############define OK button
$button = New-Object “System.Windows.Forms.Button”;
$button.Left = 460;
$button.Top = 110;
$button.Width = 100;
$button.Text = “Ok”;

############# This is when you have to close the form after getting values
$eventHandler = [System.EventHandler]{
$textBox1.Text;
$textBox2.Text;
$textBox3.Text;
$textBox4.Text;
$textBox5.Text;
$textBox6.Text;
$textBox7.Text;
$textBox8.Text;

$form.Close();};

$button.Add_Click($eventHandler) ;

#############Add controls to all the above objects defined
$form.Controls.Add($button);
$form.Controls.Add($textLabel1);
$form.Controls.Add($textLabel2);
$form.Controls.Add($textLabel3);
$form.Controls.Add($textLabel4);
$form.Controls.Add($textLabel5);
$form.Controls.Add($textLabel6);
$form.Controls.Add($textLabel7);
$form.Controls.Add($textLabel8);
$form.Controls.Add($textBox1);
$form.Controls.Add($textBox2);
$form.Controls.Add($textBox3);
$form.Controls.Add($textBox4);
$form.Controls.Add($textBox5);
$form.Controls.Add($textBox6);
$form.Controls.Add($textBox7);
$form.Controls.Add($textBox8);
$ret = $form.ShowDialog();

#################return values

return $textBox1.Text, $textBox2.Text, $textBox3.Text, $textBox4.Text, $textBox5.Text, $textBox6.Text, $textBox7.Text, $textBox8.Text
}
 
$return= button “EC2 Server Request Form - Windows” “Host name*” “Owner*(_adm/solarch)” “Tech Contact*(user@fredhutch.org)” “Billing Contact*(user@fredhutch.org)” "Password" "Root Volume Size (GB)" "PHI (Yes,No)" "PII (Yes, No)"

##################set variables
$Name,$Owner,$TechContact,$BillingContact,$Password,$RootVolSize,$Phi,$Pii = $return

##################run configure script with parameters
##.\ec2-provision-instance.ps1 -Name $Name -Owner $Owner -TechContact $TechContact -BillingContact $BillingContact -Password $Password -RootVolSize $RootVolSize -Phi $Phi -Pii $Pii

##################variable check (comment out previous command)
get-variable name,owner,techcontact,billingcontact,password,rootvolsize,phi,pii,instancetype