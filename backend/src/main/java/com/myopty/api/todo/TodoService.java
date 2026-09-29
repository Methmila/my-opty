package com.myopty.api.todo;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class TodoService {


    private final TodoRepository todoRepository;


    public TodoService(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }


    public List<Todo> getAllTodos() {
        return todoRepository.findAllByOrderByCreatedAtDesc();
    }


    public Todo createTodo(Todo todo) {
        return todoRepository.save(todo);
    }


    public Todo getTodoById(Long id) {
        return todoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Todo not found with id: " + id));
    }


    public Todo updateTodo(Long id, Todo todoDetails) {
        Todo todo = getTodoById(id);
        todo.setTitle(todoDetails.getTitle());
        todo.setDescription(todoDetails.getDescription());
        todo.setDueDate(todoDetails.getDueDate());
        todo.setStatus(todoDetails.getStatus());
        todo.setPriority(todoDetails.getPriority());
        return todoRepository.save(todo);
    }


    public void deleteTodo(Long id) {
        todoRepository.deleteById(id);
    }


    public List<Todo> getTodosByStatus(String status) {
        return todoRepository.findByStatus(Todo.Status.valueOf(status));
    }


    public List<Todo> getTodosSortedByPriority() {
        return todoRepository.findAllByOrderByPriorityAscCreatedAtDesc();
    }


    public List<Todo> getPendingTodosFIFO() {
        return todoRepository.findAllByStatusOrderByCreatedAtAsc(Todo.Status.PENDING);
    }


    public List<Todo> getActiveTasks() {
        return todoRepository.findByStatusNot(Todo.Status.DONE);
    }


    public List<Todo> getOverdueTasks() {
        return todoRepository.findByDueDateBeforeAndStatusNot(java.time.LocalDate.now(), Todo.Status.DONE);
    }


    public boolean isOverdue(Todo todo) {
        if (todo.getDueDate() == null || todo.getStatus() == Todo.Status.DONE) {
            return false;
        }
        return todo.getDueDate().isBefore(java.time.LocalDate.now());
    }


    public List<Todo> getAllSortedByPriorityThenDate() {
        return todoRepository.findAllByOrderByPriorityAscCreatedAtDesc();
    }
}