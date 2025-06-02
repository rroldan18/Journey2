D1: vlan creation + dhcp + svi:
config t 
vlan 11
 name vlan11.com.ph
 exit
Int vlan 11
 no shut
 ip add 10.0.0.65 255.255.255.192
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.0.65 10.0.0.70
ip dhcp pool vlan11.com.ph   
 network 10.0.0.64 255.255.255.192
 default-router 10.0.0.65
 domain-name vlan11.com.ph
 option 150 ip 10.51.100.8
 @A1:
 conf t
 Int e 0/0
  switchport mode access
  switchport access vlan 11
  @P1:
  conf t
  Int e 0/0
  no shut
  ip address dhcp

  ------
