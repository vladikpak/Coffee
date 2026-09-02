<#import "../../layout/main.ftlh" as layout>
<@layout.layout title="View Message">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-envelope me-2"></i>Message #${contact.id}</h2>
        <a href="/admin/contacts" class="btn btn-outline-secondary">Back</a>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between">
                <div>
                    <strong>From:</strong> ${contact.name}
                    <span class="badge bg-secondary ms-2">${contact.email}</span>
                </div>
                <div>
                    <strong>Date:</strong> ${contact.createdAt!""}
                    <#if contact.status == "NEW">
                        <span class="badge bg-warning ms-2">New</span>
                    <#elseif contact.status == "READ">
                        <span class="badge bg-info ms-2">Read</span>
                    <#elseif contact.status == "REPLIED">
                        <span class="badge bg-success ms-2">Replied</span>
                    </#if>
                </div>
            </div>
            <#if contact.subject??>
                <div class="mt-1"><strong>Subject:</strong> ${contact.subject}</div>
            </#if>
        </div>
        <div class="card-body">
            <p>${contact.message}</p>
        </div>
    </div>

    <#if contact.status == "REPLIED" && contact.adminReply??>
        <div class="card mt-3 border-success">
            <div class="card-header bg-success text-white">
                <i class="fas fa-reply me-2"></i>Admin Reply
                <small class="ms-2">${contact.repliedAt!""}</small>
            </div>
            <div class="card-body">
                <p>${contact.adminReply}</p>
            </div>
        </div>
    </#if>

    <#if contact.status != "REPLIED">
        <div class="card mt-3">
            <div class="card-header">
                <i class="fas fa-reply me-2"></i>Reply
            </div>
            <div class="card-body">
                <form action="/admin/contacts/${contact.id}/reply" method="post">
                    <div class="form-floating">
                        <textarea name="reply" class="form-control" rows="5" placeholder="Your reply..." required></textarea>
                        <label>Your reply</label>
                    </div>
                    <button type="submit" class="btn btn-success mt-3">
                        <i class="fas fa-paper-plane me-2"></i>Send Reply
                    </button>
                </form>
            </div>
        </div>
    </#if>
</div>

</@layout.layout>