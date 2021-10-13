set(IoTivity_dir "~/iot-lite/iotivity-lite")
set(IoTivity_esp32_dir "${IoTivity_dir}/port/esp32")

set(includes
    ${CMAKE_CURRENT_SOURCE_DIR}
	${IoTivity_esp32_dir}/adapter/include
	${IoTivity_dir}
	${IoTivity_dir}/include
	${IoTivity_dir}/messaging/coap
	${IoTivity_dir}/port
	${IoTivity_dir}/util
	${IoTivity_dir}/util/pt
	${IoTivity_dir}/deps/tinycbor/src
)

set(sources
	${IoTivity_dir}/deps/tinycbor/src/cborencoder.c
	${IoTivity_dir}/deps/tinycbor/src/cborencoder_close_container_checked.c
	${IoTivity_dir}/deps/tinycbor/src/cborparser.c

	${IoTivity_esp32_dir}/adapter/src/random.c
	${IoTivity_esp32_dir}/adapter/src/storage.c
	${IoTivity_esp32_dir}/adapter/src/clock.c
	${IoTivity_esp32_dir}/adapter/src/ipadapter.c
	${IoTivity_esp32_dir}/adapter/src/abort.c
	${IoTivity_esp32_dir}/adapter/src/debug_print.c
	${IoTivity_esp32_dir}/adapter/src/vfs_pipe.c
	${IoTivity_esp32_dir}/adapter/src/tcpadapter.c

	${IoTivity_dir}/util/oc_etimer.c
	${IoTivity_dir}/util/oc_list.c
	${IoTivity_dir}/util/oc_memb.c
	${IoTivity_dir}/util/oc_mmem.c
	${IoTivity_dir}/util/oc_process.c
	${IoTivity_dir}/util/oc_timer.c
	${IoTivity_dir}/api/oc_base64.c
	${IoTivity_dir}/api/oc_blockwise.c
	${IoTivity_dir}/api/oc_buffer.c
	${IoTivity_dir}/api/oc_client_api.c
	${IoTivity_dir}/api/oc_core_res.c
	${IoTivity_dir}/api/oc_discovery.c
	${IoTivity_dir}/api/oc_endpoint.c
	${IoTivity_dir}/api/oc_helpers.c
	${IoTivity_dir}/api/oc_introspection.c
	${IoTivity_dir}/api/oc_main.c
	${IoTivity_dir}/api/oc_network_events.c
	${IoTivity_dir}/api/oc_rep.c
	${IoTivity_dir}/api/oc_ri.c
	${IoTivity_dir}/api/oc_server_api.c
	${IoTivity_dir}/api/oc_uuid.c
	${IoTivity_dir}/api/oc_enums.c
	${IoTivity_dir}/api/oc_session_events.c
	${IoTivity_dir}/messaging/coap/coap.c
	${IoTivity_dir}/messaging/coap/engine.c
	${IoTivity_dir}/messaging/coap/observe.c
	${IoTivity_dir}/messaging/coap/separate.c
	${IoTivity_dir}/messaging/coap/transactions.c
)

if (CONFIG_OC_DEBUG)
  add_definitions(-DOC_DEBUG)
endif()

if (CONFIG_IPV4)
  add_definitions(-DOC_IPV4)
endif()

if (CONFIG_TCP)
  add_definitions(-DOC_TCP)
  list(APPEND sources
  	${IoTivity_esp32_dir}/adapter/src/tcpadapter.c
	${IoTivity_dir}/messaging/coap/coap_signal.c
  )
endif()

if (CONFIG_CLOUD)
  add_definitions(-DOC_CLOUD -DOC_DYNAMIC_ALLOCATION -DOC_TCP -DOC_IPV4)
  list(APPEND sources
  	${IoTivity_dir}/api/cloud/oc_cloud_apis.c
	${IoTivity_dir}/api/cloud/oc_cloud_manager.c
	${IoTivity_dir}/api/cloud/oc_cloud_rd.c
	${IoTivity_dir}/api/cloud/oc_cloud_resource.c
	${IoTivity_dir}/api/cloud/oc_cloud_store.c
	${IoTivity_dir}/api/cloud/oc_cloud.c
	${IoTivity_dir}/api/cloud/rd_client.c
  )
endif()

if (CONFIG_DYNAMIC)
  add_definitions(-DOC_DYNAMIC_ALLOCATION)
  list(APPEND sources
      ${IoTivity_dir}/api/oc_collection.c
  )
endif()

if (CONFIG_SECURE)
  add_definitions(-DOC_SECURITY -DOC_PKI -DAPP_DEBUG)
  list(APPEND sources
	${IoTivity_dir}/security/oc_acl.c
	${IoTivity_dir}/security/oc_ael.c
	${IoTivity_dir}/security/oc_audit.c
	${IoTivity_dir}/security/oc_certs.c
	${IoTivity_dir}/security/oc_cred.c
	${IoTivity_dir}/security/oc_csr.c
	${IoTivity_dir}/security/oc_doxm.c
	${IoTivity_dir}/security/oc_keypair.c
	${IoTivity_dir}/security/oc_obt.c
	${IoTivity_dir}/security/oc_obt_certs.c
	${IoTivity_dir}/security/oc_obt_otm_cert.c
	${IoTivity_dir}/security/oc_obt_otm_justworks.c
	${IoTivity_dir}/security/oc_obt_otm_randompin.c
	${IoTivity_dir}/security/oc_pki.c
	${IoTivity_dir}/security/oc_pstat.c
	${IoTivity_dir}/security/oc_roles.c
	${IoTivity_dir}/security/oc_sdi.c
	${IoTivity_dir}/security/oc_sp.c
	${IoTivity_dir}/security/oc_store.c
	${IoTivity_dir}/security/oc_svr.c
	${IoTivity_dir}/security/oc_tls.c
	${IoTivity_dir}/api/oc_clock.c
	${IoTivity_dir}/api/c-timestamp/timestamp_format.c
	${IoTivity_dir}/api/c-timestamp/timestamp_tm.c
	${IoTivity_dir}/api/c-timestamp/timestamp_valid.c
	${IoTivity_dir}/api/c-timestamp/timestamp_parse.c
	${IoTivity_dir}/api/c-timestamp/timestamp_compare.c
  )
endif()

#add_definitions(-DOC_CLIENT)
#add_definitions(-DOC_SERVER)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-format-truncation")

list(APPEND sources
  main.c
)

idf_component_register(
	SRCS
		${sources}
	INCLUDE_DIRS
		${includes}
)

set_source_files_properties(${sources}
   PROPERTIES COMPILE_FLAGS
    "-DOC_SERVER -DOC_CLIENT"
)
