$password = "Secret" | ConvertTo-SecureString -asPlainText -Force
$username = "mydomain\administrator"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Import-Csv c:\Computers.csv | ForEach-Object {
    	Invoke-Command -ComputerName $($_.Name) {shutdown -f -s} -Credential $credential
}