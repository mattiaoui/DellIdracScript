IP1=IDRAC_IP_ADDRESS
USER=root
NEW_PWD=password
SMTPSERVER=IP_OR_FQDN
EMAIl1=ict@mydomain.com
#EMAIL2=SECONDARYEmail@domain.com
VNCPSWD=VNC_PASSWORD
DOMAINNAME=mydomain.com
IDRACNAME=idrac_name
SYSLOGip=0.0.0.0
SYSLOGport=514
DNS1=1.2.3.4
DNS2=1.2.3.4
NTP1=1.2.3.4
NTP2=1.2.3.4
TZ=Europe/Rome
#
#
#
#
##RACADM CONFIGURE SMTP SERVER
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.RemoteHosts.SMTPServerIPAddress $SMTPSERVER
#
#
##RACADM CONFIGURE FIRST EMAIL ADDRESS
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.EmailAlert.Address.1 $EMAIl1
###SET SECONDARY EMAIL ADDRESS
#racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.EmailAlert.Address.1 $EMAIl2
#
#
##RACADM ENABLE VNC 
racadm -r $IP1 -u $USER -p $NEW_PWD set idrac.vncserver.enable Enabled
###SET VNC PASSWORD
racadm -r $IP1 -u $USER -p $NEW_PWD set idrac.vncserver.Password $VNCPSWD
#
#
##RACADM ENABLE EMAIL
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.EmailAlert.Enable.1 1
###ENABLE SECONDARY EMAIL ADDRESS
#racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.EmailAlert.Enable.2 1
#
#
##RACADM ENABLE EVENT WITH EMAIL
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.storage.warning -a none -n email,snmp
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.storage.critical -a none -n email,snmp
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.System.warning -a none -n email,snmp
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.System.critical -a none -n email,snmp
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.config.warning -a none -n email,snmp
racadm -r $IP1 -u $USER -p $NEW_PWD eventfilters set -c idrac.alert.config.critical -a none -n email,snmp
#
#
##RACADM SET SYSLOG SERVER
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.Syslog.SyslogEnable 1 
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.SysLog.Server1 $SYSLOGip
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.SysLog.Port $SYSLOGport
#
#
##RACADM SET IDRAC PARAMETERS
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.NIC.DNSDomainName $DOMAINNAME
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.NIC.DNSRacName $IDRACNAME
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.IPv4.DNS1 $DNS1
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.IPv4.DNS2 $DNS2
#
#
##RACADM SET NTP and TIME ZONE
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.NTPConfigGroup.NTP1 $NTP1
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.NTPConfigGroup.NTP2 $NTP2
racadm -r $IP1 -u $USER -p $NEW_PWD set iDRAC.Time.Timezone $TZ



