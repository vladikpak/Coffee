<#import "layout/main.ftlh" as layout>
<@layout.layout title="Error">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-body p-5 text-center">
                    <div class="mb-4">
                        <div class="bg-danger bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto"
                             style="width: 100px; height: 100px;">
                            <i class="fas fa-exclamation-triangle text-danger" style="font-size: 50px;"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold text-dark mb-2">Oops! Something went wrong</h2>
                    <p class="text-danger">${error!}</p>
                    <a href="/" class="btn btn-primary mt-3">Go Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.layout>