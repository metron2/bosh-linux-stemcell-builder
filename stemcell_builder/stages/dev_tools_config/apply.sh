#!/usr/bin/env bash

set -e

base_dir=$(readlink -nf $(dirname $0)/../..)
source $base_dir/lib/prelude_apply.bash
source $base_dir/lib/prelude_bosh.bash

cp -p $assets_dir/generate_dev_tools_file_list.sh $chroot/bin/generate_dev_tools_file_list
run_in_chroot $chroot "/bin/generate_dev_tools_file_list | sort | uniq > /var/vcap/bosh/etc/dev_tools_file_list"
rm $chroot/bin/generate_dev_tools_file_list
