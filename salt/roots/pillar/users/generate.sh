#!/bin/bash
OUT=$1.sls
#echo "include:
#  - users.admin
#" > $OUT
# echo "" > $OUT
# echo "{% if grains['os'] == 'Debian' %}
# {% set adm_group = 'sudo' %}
# {% else %}
# {% set adm_group = 'wheel' %}
# {% endif %}
# " > $OUT
echo '{% from "users/map.jinja" import users with context %}
' > $OUT
#echo "users:" >> $OUT
echo "$1:" >> $OUT
echo "" >> $OUT
cat $1 | while read first last
do
shortname="`echo ${first:0:1}${last} | tr [:upper:] [:lower:]`"
echo "  ${shortname}:" >> $OUT
echo "    fullname: ${first} ${last}" >> $OUT
# echo "    groups:" >> $OUT
#echo "      - {{ pillar['adm_group'] }}" >> $OUT
# echo "      - {{ users.adm_group }}" >> $OUT
# echo "       - sudo" >> $OUT
#echo "      - {{ salt['pillar.get']('adm_group') }}" >> $OUT
#echo "      - sudo" >> $OUT
# echo '    password: $2a$08$SUaWxmEBh/lBmSHHHtatV.fIHZ4qr6bDjF6KQRzymFyVLBWL2ncwK' >> $OUT
echo "    home: /home/${shortname}" >> $OUT
#echo "    sudouser: True" >> $OUT
echo "    pub_ssh_keys:" >> $OUT
echo "      - `cat testkeys/${shortname}.pub`" >> $OUT

echo "" >> $OUT
done
