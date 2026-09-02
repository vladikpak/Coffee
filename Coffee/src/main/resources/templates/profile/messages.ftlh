<#import "../layout/main.ftlh" as layout>
<@layout.layout title="My Messages">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-envelope me-2"></i>My Messages</h2>
        <a href="/profile" class="btn btn-outline-secondary">← Back</a>
    </div>

    <#if messages?? && messages?size gt 0>
        <#list messages as msg>
            <div class="card mb-3">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <strong>${msg.subject!}</strong>
                        <span class="badge bg-secondary ms-2">${msg.status}</span>
                    </div>
                    <small class="text-secondary">${msg.createdAt!""}</small>
                </div>
                <div class="card-body">
                    <p><strong>You:</strong> ${msg.message}</p>
                    <#if msg.status == "REPLIED" && msg.adminReply??>
                        <div class="alert alert-success mt-2">
                            <p><strong>Admin reply:</strong></p>
                            <p>${msg.adminReply}</p>
                            <small class="text-secondary">${msg.repliedAt!""}</small>
                        </div>
                    <#elseif msg.status == "NEW">
                        <p class="text-warning">⏳ Waiting for reply</p>
                    </#if>
                </div>
            </div>
        </#list>
    <#else>
        <div class="text-center py-5">
            <i class="fas fa-inbox text-secondary" style="font-size: 4rem;"></i>
            <h4 class="mt-3">No messages</h4>
            <p class="text-secondary">You haven't sent any messages yet.</p>
            <a href="/contact" class="btn btn-primary mt-2">Contact us</a>
        </div>
    </#if>
</div>

</@layout.layout>