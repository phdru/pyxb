PYXB_ARCHIVE_PATH=bindings:+
PYTHONPATH=../../..
rm -rf bindings
mkdir -p bindings
touch bindings/__init__.py

#../../../scripts/pyxbgen -m bindings.A -u a_c.xsd -C
#../../../scripts/pyxbgen -m bindings.B -u b_c.xsd -C
../../../scripts/pyxbgen \
  --module-prefix=bindings \
  --schema-location=d_c.xsd --module=D \
  --archive-file=bindings/D.wxs
