#!/bin/bash
rm -Rf /etc/suricata/iprep/reputation.list
python3 /opt/OTX-Suricata-master/otx-suricata/suricata.py --key 3f59b21830614df4e88ef727cc576a89a5bd58d831a01856ff34a9f65035b51c --skip-filemd5  --destination-directory /etc/suricata/iprep/
curl -Lo /tmp/talos_ip "http://www.talosintelligence.com/documents/ip-blacklist"
sed "s/$/,41,127/" /tmp/talos_ip >> /etc/suricata/iprep/reputation.list
systemctl restart suricata
