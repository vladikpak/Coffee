<#import "../../layout/main.ftlh" as layout>
<@layout.layout title="Messages">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>
            <i class="fas fa-envelope me-2"></i>Messages
            <#if newCount?? && newCount gt 0>
                <span class="badge bg-danger">${newCount} new</span>
            </#if>
        </h2>
        <a href="/admin" class="btn btn-outline-secondary">Back</a>
    </div>

    <div class="card">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>From</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <#if messages?? && messages?size gt 0>
                        <#list messages as msg>
                            <tr class="${(msg.status == 'NEW')?then('table-warning', '')}">
                                <td>${msg.id}</td>
                                <td>${msg.name}</td>
                                <td>${msg.email}</td>
                                <td>${msg.subject!}</td>
                                <td>${msg.createdAt!""}</td>
                                <td>
                                    <#if msg.status == "NEW">
                                        <span class="badge bg-warning text-dark">New</span>
                                    <#elseif msg.status == "READ">
                                        <span class="badge bg-info">Read</span>
                                    <#elseif msg.status == "REPLIED">
                                        <span class="badge bg-success">Replied</span>
                                    </#if>
                                </td>
                                <td>
                                    <a href="/admin/contacts/${msg.id}" class="btn btn-sm btn-primary">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                </td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="7" class="text-center py-4">No messages</td>
                        </tr>
                    </#if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</@layout.layout>