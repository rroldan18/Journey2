D2: vlan creation + dhcp + svi:
config t 
vlan 12
 name vlan12.com.ph
 exit
Int vlan 12
 no shut
 ip add 10.0.0.129 255.255.255.128
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.0.129 10.0.0.139
ip dhcp pool vlan12.com.ph   
 network 10.0.0.128 255.255.255.128
 default-router 10.0.0.128
 domain-name vlan12.com.ph
 @A2:
 conf t
 Int e 1/0
  switchport mode access
  switchport access vlan 12
  @P2:
  conf t
  Int e 1/0
  no shut
  ip address dhcp
