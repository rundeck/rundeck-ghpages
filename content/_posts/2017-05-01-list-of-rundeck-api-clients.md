---
title: List of Rundeck API Clients and Tools
layout: content
comments: true
author: Rundeck Project
---

In addition to the [official Rundeck CLI tool `rd`](https://rundeck.github.io/rundeck-cli/)
here a number of CLI tools and SDK libraries that let you use Rundeck from your language of choice.

Or if you prefer you can access the API directly: see [the API documentation](http://rundeck.org/docs/api/).

We will keep it updated as we discover new projects.

Do you know of a project not listed here?
Please let us know [in the comments]({{post.url}}), or [via twitter](https://twitter.com/rundeck).

---

{% for member in site.data.rundeck-clients %}
  <div>
    {{ member.lang }}
    <ul>
    {% for proj in member.projects %}
    <li>
    <a href="{{ proj.link }}">
      {{ proj.link }}
    </a>
    ({{ proj.comment }})
    </li>
{% endfor %}
    </ul>
  </div>
{% endfor %}
