package com.zen.terraform.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
public class ApiController {

   @GetMapping
   public ResponseEntity<TimestampResponseDTO> helloDevOps() {
      return ResponseEntity.ok(new TimestampResponseDTO(Instant.now()));
   }

}
