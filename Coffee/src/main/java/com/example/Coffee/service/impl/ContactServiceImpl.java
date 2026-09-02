package com.example.Coffee.service.impl;

import com.example.Coffee.model.Contact;
import com.example.Coffee.model.User;
import com.example.Coffee.repository.ContactRepository;
import com.example.Coffee.service.ContactService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class ContactServiceImpl implements ContactService {

    private final ContactRepository contactRepository;

    @Override
    public void saveMessage(Contact contact) {
        contact.setStatus("NEW");
        contact.setCreatedAt(LocalDateTime.now());

        contactRepository.save(contact);
    }

    @Override
    public List<Contact> getAllMessages() {
        return contactRepository.findAllByOrderByCreatedAtDesc();
    }

    @Override
    public Contact getMessageById(Long id) {
        return contactRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Message not found"));
    }

    @Override
    public List<Contact> getMessagesByUserId(Long userId) {
        return contactRepository.findByUserId(userId);
    }

    @Override
    public void markAsRead(Long id) {
        Contact contact = getMessageById(id);

        if ("NEW".equals(contact.getStatus())) {
            contact.setStatus("READ");

            contactRepository.save(contact);
        }
    }

    @Override
    public void replyToMessage(Long id, String reply, User admin) {
        Contact contact = getMessageById(id);

        contact.setAdminReply(reply);
        contact.setAdmin(admin);
        contact.setRepliedAt(LocalDateTime.now());
        contact.setStatus("REPLIED");

        contactRepository.save(contact);
    }

    @Override
    public void deleteMessage(Long id) {
        contactRepository.deleteById(id);
    }
}
