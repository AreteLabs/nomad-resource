payload=$(mktemp $TMPDIR/script-request.XXXXXX)

cat > $payload <&0

url=$(jq -r '.source.url // ""' < $payload)
name="$(jq -r '.source.name // ""' < $payload)"

if [ -z "$url" ]
then
  echo >&2 "invalid payload (missing url):"
  cat $payload >&2
  exit 1
fi

if [ -z "$name" ]
then
  echo >&2 "invalid payload (missing name):"
  cat $payload >&2
  exit 1
fi

calc_reference() {
  curl -Ls ${url}/v1/job/${name} | jq .ModifyIndex
}

calc_status() {
  curl -Ls ${url}/v1/job/${name} | jq .Status
}
