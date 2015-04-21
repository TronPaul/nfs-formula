{% from "nfs/map.jinja" import nfs with context %}
{% macro get(value, item) %}
  {{ value.get(item, nfs.mounts.get(item)) }}
{% endmacro %}

nfs-client-deps:
    pkg.installed:
        - pkgs: {{ nfs.pkgs_client|json }}

{% for mount in nfs.mounts %}
{{get(mount, 'mount_point')}}:
    mount.mounted:
        - device: {{get(mount, 'url')}}
        - fstype: nfs
        - mkmnt: {{get(mount, 'mkmnt')}}
        - opts: {{get(mount, 'opts')}}
        - config: {{get(mount, 'config')}}
        - persist: {{get(mount, 'persist')}}
        - mount: {{get(mount, 'mount')}}
        - user: {{get(mount, 'user')}}
{% endfor %}
