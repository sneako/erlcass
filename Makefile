REBAR=rebar

nif_compile:
	@./build_deps.sh $(CPP_DRIVER_REV)
	@make V=0 -C c_src -j 8

nif_clean:
	@make -C c_src clean

compile:
	${REBAR} compile

clean:
	${REBAR} clean

ct:
	mkdir -p logs
	ct_run -suite integrity_test_SUITE -pa ebin -include include -logdir logs