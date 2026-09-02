package com.example.Coffee.service;

import com.example.Coffee.model.Contact;
import com.example.Coffee.model.User;

import java.util.List;

public interface ContactService {
    void saveMessage(Contact contact);

    List<Contact> getAllMessages();

    Contact getMessageById(Long id);

    List<Contact> getMessagesByUserId(Long userId);

    void markAsRead(Long id);

    void replyToMessage(Long id, String reply, User admin);

    void deleteMessage(Long id);
}
