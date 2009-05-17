PYTHONPATH=../..
export PYTHONPATH
URI='http://www.weather.gov/forecasts/xml/DWMLgen/schema/DWML.xsd'
PREFIX='DWML'

mkdir -p raw
touch raw/__init__.py
../../scripts/genbind \
   -u "${URI}" \
   -p "${PREFIX}" \
   -r 
if [ ! -f ${PREFIX}.py ] ; then
  echo "from raw.${PREFIX} import *" > ${PREFIX}.py
fi

# Retrieve the wsdl.  Heck, show it off even.  Just not using it yet.
WSDL_URI='http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl'
if [ ! -f ndfdXML.wsdl ] ; then
  wget ${WSDL_URI}
fi
../../scripts/showwsdl file:ndfdXML.wsdl