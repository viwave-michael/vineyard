Experiment for actility server uplink:

POST host://uplink.xml?LrnDevEui=00007EB4&LrnFPort=2&LrnInfos=UPHTTP_LAB_LORA

with XML payload:
<?xml version="1.0" encoding="UTF-8"?>
<DevEUI_uplink xmlns="http://uri.actility.com/lora">
  ...
  <payload_hex>0027bf838022bd00</payload_hex>
  ...
</DevEUI_uplink>