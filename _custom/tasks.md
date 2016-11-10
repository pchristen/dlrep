---
order: 3
title: Tasks
permalink: /tasks
---

This page contains a list of tasks related to Data Linkage.

<div style="width: 80%; margin: 0 auto;">
<table class="table table-hover data-table">
    <thead>
    <tr>
        <!-- <th style="width: 50%"> Date added </th> -->
        <th style="width: 50%"> Title </th>
    </tr>
    </thead>
    <tbody>
{% assign items_sorted = site.tasks | sort: 'date' %}
{% for item in items_sorted %}
    <tr>
        <td> <a href="{{ item.url | prepend: site.baseurl }}"> {{ item.title }} </a> </td>
    </tr>
{% endfor %}
    </tbody>
</table>
</div>
