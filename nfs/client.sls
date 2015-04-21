{% from "nfs/map.jinja" import nfs with context %}

nfs-client-deps:
    pkg.installed:
        - pkgs: {{ nfs.pkgs_client|json }}

{% for mount in nfs.mounts %}
{{mount.mount_point}}:
    mount.mounted:
        - device: {{mount.url}}
        - fstype: nfs
        - mkmnt: {{mount.managed}}
        - opts: {{mount.opts}}
        - config: {{mount.config}}
        - persist: {{mount.persist}}
        - user: {{mount.user}}
{% endfor %}
