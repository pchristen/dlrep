---
order: 4
title: Tags
permalink: /tags
---

This page contains a list of all tags we use in the repository.

Both data sets and tasks may have a list of tags associated to them.
Follow the link to an individual tag to see all entries that have that tag.

<div style="width: 80%; margin: 0 auto;">
<table class="table table-hover data-table">
    <thead>
    <tr>
        <th> Title </th>
        <th> Description </th>
    </tr>
    </thead>
    <tbody>
{% assign items_sorted = site.tags | sort: 'tag' %}
{% for item in items_sorted %}
    <tr>
        <td> <a href="{{ item.url | prepend: site.baseurl }}"> {{ item.tag }} </a> </td>
        <td> {{ item.content }} </td>
    </tr>
{% endfor %}
    </tbody>
</table>
</div>
