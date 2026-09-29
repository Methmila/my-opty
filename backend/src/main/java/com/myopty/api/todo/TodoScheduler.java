package com.myopty.api.todo;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.time.LocalDate;
import java.util.List;


@Component
public class TodoScheduler {


    private final TodoService todoService;


    public TodoScheduler(TodoService todoService) {
        this.todoService = todoService;
    }


    @Scheduled(cron = "0 0 9 * * MON-FRI")
    public void checkOverdueTasks() {
        List<Todo> overdueTasks = todoService.getOverdueTasks();

        for (Todo todo : overdueTasks) {
            String message = String.format(
                    "OVERDUE REMINDER: Task '%s' (ID: %d) is overdue! Due date was %s, status: %s",
                    todo.getTitle(), todo.getId(), todo.getDueDate(), todo.getStatus());

            System.out.println(message);
            // In a real application, you would send an email or notification here
        }
    }
}