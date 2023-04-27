package main.org.example.controller;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import main.org.example.model.Contact;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Controller
@FieldDefaults(level = AccessLevel.PRIVATE)
@RequestMapping
public class AppController {
    List<Contact> contacts = new LinkedList();
    Random random = new Random();
    /**
     * Добавление нового абонента в список контактов
     */
    @GetMapping("/")
    public String addContactForm(Model model) {
        Contact contact = new Contact();
        model.addAttribute("contact", contact);
        return "index";
    }

    /**
     * Добавление нового контакта
     */
    @PostMapping(value = "/save")
    public String add(@ModelAttribute("contact") Contact contact) {
        contact.setId(random.nextInt(1000));
        contacts.add(contact);
        return "redirect:/contacts";
    }

    /**
     * Получение всего списка контактов
     */
    @GetMapping("/contacts")
    public String getAll(Model model){
        model.addAttribute("contacts", contacts);
        return "contacts";
    }

    /**
     * Обновление контакта по его id
     */
    @RequestMapping("/edit")
    public String updateForm(@RequestParam("id") int id, Model model){
        Contact contact = contacts.stream().filter(item -> item.getId() == id).findFirst().get();
        model.addAttribute("contact", contact);
        return "edit";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("contact") Contact contact){
        contacts = contacts.stream().filter(item -> item.getId() != contact.getId()).collect(Collectors.toList());
        contacts.add(contact);
        return "redirect:/contacts";
    }

    /**
     * Удаление контакта по его id
     */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id){
        contacts = contacts.stream().filter(item -> item.getId() != id).collect(Collectors.toList());
        return "redirect:/contacts";
    }
}
