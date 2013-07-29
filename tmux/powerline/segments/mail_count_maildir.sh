#!/usr/bin/env bash
# Return the number of new mails in a maildir.

maildir="$HOME/.mail/ATDesk"

cd "$(dirname $0)"

nbr_new=0
boxes=$(find $maildir -type d -wholename "*INBOX*new")

for x in $boxes; do
  ((nbr_new += $(ls $x | wc -l) ))
done

if [ "$nbr_new" -gt "0" ]; then
  echo "✉ ${nbr_new}"
fi

exit 0;
