(module
	(import "env" "seal_return" (func $seal_return (param i32 i32 i32)))
	(import "env" "seal_deposit_event" (func $seal_deposit_event (param i32 i32 i32 i32)))
	(import "env" "memory" (memory 1 1))

	(start $start)
	(func $start
		(call $seal_deposit_event
			(i32.const 0) ;; The topics buffer
			(i32.const 0) ;; The topics buffer's length
			(i32.const 8) ;; The data buffer
			(i32.const 4) ;; The data buffer's length
		)
		(call $seal_return
			(i32.const 0)
			(i32.const 8)
			(i32.const 4)
		)
		(unreachable)
	)

	(func (export "call")
		(unreachable)
	)
	(func (export "deploy"))

	(data (i32.const 8) "\01\02\03\04")
)
