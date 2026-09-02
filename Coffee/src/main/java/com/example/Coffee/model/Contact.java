package com.example.Coffee.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "contacts")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "subject")
    private String subject;

    @Column(name = "message", length = 65535)
    private String message;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "status")
    private String status;

    @Column(name = "admin_reply")
    private String adminReply;

    @Column(name = "replied_at")
    private LocalDateTime repliedAt;

    @Column(name = "user_id")
    private Long userId;

    @ManyToOne
    @JoinColumn(name = "admin_id")
    private User admin;
}