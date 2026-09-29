package com.myopty.api.todo;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/todos")
@CrossOrigin(origins = "http://localhost:3000")
public class TodoController {


    private final TodoService todoService;


    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }


    @GetMapping
    public List<Todo> getAllTodos() {
        return todoService.getAllTodos();
    }


    @PostMapping
    public Todo createTodo(@RequestBody Todo todo) {
        return todoService.createTodo(todo);
    }


    @GetMapping("/{id}")
    public ResponseEntity<Todo> getTodoById(@PathVariable Long id) {
        return ResponseEntity.ok(todoService.getTodoById(id));
    }


    @PutMapping("/{id}")
    public ResponseEntity<Todo> updateTodo(@PathVariable Long id, @RequestBody Todo todoDetails) {
        return ResponseEntity.ok(todoService.updateTodo(id, todoDetails));
    }


    @GetMapping("/status/{status}")
    public List<Todo> getTodosByStatus(@PathVariable String status) {
        return todoService.getTodosByStatus(status);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTodo(@PathVariable Long id) {
        todoService.deleteTodo(id);
        return ResponseEntity.ok().<Void>build();
    }


    @GetMapping("/priority")
    public List<Todo> getTodosSortedByPriority() {
        return todoService.getTodosSortedByPriority();
    }


    @GetMapping("/pending/fifo")
    public List<Todo> getPendingTodosFIFO() {
        return todoService.getPendingTodosFIFO();
    }


    @GetMapping("/active")
    public List<Todo> getActiveTasks() {
        return todoService.getActiveTasks();
    }
}