---
order: 2
title: Data Sets
permalink: /datasets
---

This page contains a list of data sets.

<div style="width: 80%; margin: 0 auto;">
<table class="table table-hover data-table">
    <thead>
    <tr>
        <th style="width: 50%"> Date added </th>
        <th style="width: 50%"> Title </th>
    </tr>
    </thead>
    <tbody>
{% assign items_sorted = site.datasets | sort: 'date' %}
{% for item in items_sorted %}
    <tr>
        <td> {{ item.date | date: '%-d %B %Y' }} </td>
        <td> <a href="{{ site.baseurl }}/{{ item.url }}"> {{ item.title }} </a> </td>
    </tr>
{% endfor %}
    </tbody>
</table>
</div>
