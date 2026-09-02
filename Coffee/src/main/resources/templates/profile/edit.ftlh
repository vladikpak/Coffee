<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Edit Profile">

<div class="edit-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <div class="edit-card">
                    <div class="edit-header">
                        <h2>Edit Profile</h2>
                        <a href="/profile" class="btn-back">← Back</a>
                    </div>

                    <#if success??>
                        <div class="alert alert-success">${success}</div>
                    </#if>

                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>

                    <form action="/profile/edit" method="post" enctype="multipart/form-data">
                        <div class="form-group text-center">
                            <div class="avatar-upload">
                                <#if currentUser.image?? && currentUser.image != "">
                                    <img src="${currentUser.image}" alt="Avatar" id="avatarPreview">
                                <#else>
                                    <div class="avatar-placeholder" id="avatarPreview">
                                        <i class="fas fa-user"></i>
                                    </div>
                                </#if>
                                <label for="avatar" class="btn-upload">
                                    <i class="fas fa-camera"></i>
                                </label>
                                <input type="file" name="avatar" id="avatar" accept="image/*" onchange="previewAvatar(event)">
                            </div>
                            <p class="text-secondary small">Click camera icon to change avatar</p>
                        </div>

                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="name" class="form-control" value="${currentUser.name!}" required>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="${currentUser.email!}" required>
                        </div>

                        <div class="form-group">
                            <label>Phone</label>
                            <input type="tel" name="phone" class="form-control" value="${currentUser.phone!}" required>
                        </div>

                        <hr>
                        <h5>Change Password</h5>
                        <p class="text-secondary small">Leave empty if you don't want to change</p>

                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••">
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirmPassword" class="form-control" placeholder="••••••••">
                        </div>

                        <button type="submit" class="btn-save">Save Changes →</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function previewAvatar(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = document.getElementById('avatarPreview');
            if (preview.tagName === 'DIV') {
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Avatar" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">';
            } else {
                preview.src = e.target.result;
            }
        }
        reader.readAsDataURL(file);
    }
}
</script>

</@layout.layout>