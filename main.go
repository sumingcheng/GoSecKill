package main

import (
	"fmt"
	"sync"
	"time"
)

func counter(wg *sync.WaitGroup) {
	defer wg.Done() // 通知WaitGroup该goroutine已完成
	count := 0
	for i := 0; i < 100; i++ {
		count += i
	}
}

func main() {
	start := time.Now()
	var wg sync.WaitGroup
	// 创建100万个goroutine
	for i := 0; i < 1000000; i++ {
		wg.Add(1)
		go counter(&wg)
	}

	wg.Wait() // 等待所有goroutine完成
	duration := time.Since(start)
	fmt.Printf("所有goroutines完成 %s\n", duration)
}
