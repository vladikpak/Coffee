<#import "layout/main.ftlh" as layout>
<@layout.layout title="Contact — Brewly">

<div class="container py-5">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="contact-title">Contact Us</h1>
            <p class="contact-subtitle">We'd love to hear from you!</p>

            <div class="contact-info">
                <div class="contact-item">
                    <span class="contact-icon">📞</span>
                    <div>
                        <h4>Phone</h4>
                        <p>+1 (555) 123-4567</p>
                    </div>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">✉️</span>
                    <div>
                        <h4>Email</h4>
                        <p>hello@brewly.com</p>
                    </div>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📍</span>
                    <div>
                        <h4>Address</h4>
                        <p>Brewville, CA 90210</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="contact-form-card">
                <h3>Send us a message</h3>

                <#if success??>
                    <div class="alert alert-success">${success}</div>
                </#if>

                <#if error??>
                    <div class="alert alert-danger">${error}</div>
                </#if>

                <form action="/contact/send" method="post">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Your Email" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="subject" class="form-control" placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" rows="5" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn-send">Send Message →</button>
                </form>
            </div>
        </div>
    </div>
</div>

</@layout.layout>