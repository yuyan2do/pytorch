# In the open-source build, these are generated into
# torch/csrc/{autgrad,jit}/generated. In fbcode, this distinction is
# not currently relevant so they are combined into one list.
load("@fbcode_macros//build_defs:cpp_library.bzl", "cpp_library")
load("@fbcode_macros//build_defs:cpp_python_extension.bzl", "cpp_python_extension")
load("@fbsource//xplat/caffe2/caffe2/fb:defs_gpu.bzl", "gpu_library_selector")

GENERATED_CPP = [
    "Functions.cpp",
    "VariableType_0.cpp",
    "VariableType_1.cpp",
    "VariableType_2.cpp",
    "VariableType_3.cpp",
    "VariableType_4.cpp",
    "register_aten_ops_0.cpp",
    "register_aten_ops_1.cpp",
    "register_aten_ops_2.cpp",
    "python_functions.cpp",
    "python_nn_functions.cpp",
    "python_torch_functions.cpp",
    "python_variable_methods.cpp",
]

# copied from https://github.com/pytorch/pytorch/blob/master/tools/cpp_build/torch/CMakeLists.txt
libtorch_sources = [
    ":generate-code=Functions.cpp",
    ":generate-code=register_aten_ops_0.cpp",
    ":generate-code=register_aten_ops_1.cpp",
    ":generate-code=register_aten_ops_2.cpp",
    ":generate-code=VariableType_0.cpp",
    ":generate-code=VariableType_1.cpp",
    ":generate-code=VariableType_2.cpp",
    ":generate-code=VariableType_3.cpp",
    ":generate-code=VariableType_4.cpp",
    "torch/csrc/autograd/VariableTypeManual.cpp",
    "torch/csrc/autograd/anomaly_mode.cpp",
    "torch/csrc/autograd/autograd.cpp",
    "torch/csrc/autograd/custom_function.cpp",
    "torch/csrc/autograd/cpp_hook.cpp",
    "torch/csrc/autograd/engine.cpp",
    "torch/csrc/autograd/function.cpp",
    "torch/csrc/autograd/function_hook.cpp",
    "torch/csrc/autograd/functions/accumulate_grad.cpp",
    "torch/csrc/autograd/functions/basic_ops.cpp",
    "torch/csrc/autograd/functions/tensor.cpp",
    "torch/csrc/autograd/functions/utils.cpp",
    "torch/csrc/autograd/input_buffer.cpp",
    "torch/csrc/autograd/profiler.cpp",
    "torch/csrc/autograd/record_function.cpp",
    "torch/csrc/autograd/record_function_ops.cpp",
    "torch/csrc/autograd/saved_variable.cpp",
    "torch/csrc/autograd/variable.cpp",
    "torch/csrc/distributed/autograd/utils.cpp",
    "torch/csrc/distributed/autograd/context/container.cpp",
    "torch/csrc/distributed/autograd/context/context.cpp",
    "torch/csrc/distributed/autograd/engine/dist_engine.cpp",
    "torch/csrc/distributed/autograd/functions/recvrpc_backward.cpp",
    "torch/csrc/distributed/autograd/functions/sendrpc_backward.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/autograd_metadata.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/propagate_gradients_req.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/propagate_gradients_resp.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/cleanup_autograd_context_req.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/cleanup_autograd_context_resp.cpp",
    "torch/csrc/distributed/autograd/rpc_messages/rpc_with_autograd.cpp",
    "torch/csrc/distributed/rpc/message.cpp",
    "torch/csrc/distributed/rpc/python_call.cpp",
    "torch/csrc/distributed/rpc/python_remote_call.cpp",
    "torch/csrc/distributed/rpc/python_resp.cpp",
    "torch/csrc/distributed/rpc/request_callback.cpp",
    "torch/csrc/distributed/rpc/rpc_agent.cpp",
    "torch/csrc/distributed/rpc/rref_context.cpp",
    "torch/csrc/distributed/rpc/rref_proto.cpp",
    "torch/csrc/distributed/rpc/rref_impl.cpp",
    "torch/csrc/distributed/rpc/torchscript_functions.cpp",
    "torch/csrc/distributed/rpc/script_call.cpp",
    "torch/csrc/distributed/rpc/script_remote_call.cpp",
    "torch/csrc/distributed/rpc/script_resp.cpp",
    "torch/csrc/distributed/rpc/types.cpp",
    "torch/csrc/distributed/rpc/utils.cpp",
    "torch/csrc/jit/runtime/autodiff.cpp",
    "torch/csrc/jit/ir/attributes.cpp",
    "torch/csrc/jit/runtime/argument_spec.cpp",
    "torch/csrc/jit/ir/constants.cpp",
    "torch/csrc/jit/api/custom_class.cpp",
    "torch/csrc/jit/ir/node_hashing.cpp",
    "torch/csrc/jit/ir/type_hashing.cpp",
    "torch/csrc/jit/serialization/export.cpp",
    "torch/csrc/jit/serialization/export_module.cpp",
    "torch/csrc/jit/passes/pass_manager.cpp",
    "torch/csrc/jit/serialization/pickler.cpp",
    "torch/csrc/jit/serialization/unpickler.cpp",
    "torch/csrc/jit/runtime/graph_executor.cpp",
    "torch/csrc/jit/serialization/import.cpp",
    "torch/csrc/jit/serialization/import_legacy.cpp",
    "torch/csrc/jit/serialization/pickle.cpp",
    "torch/csrc/jit/serialization/import_export_helpers.cpp",
    "torch/csrc/jit/runtime/instruction.cpp",
    "torch/csrc/jit/runtime/interpreter.cpp",
    "torch/csrc/jit/ir/ir.cpp",
    "torch/csrc/jit/ir/irparser.cpp",
    "torch/csrc/jit/jit_log.cpp",
    "torch/csrc/jit/netdef_converter.cpp",
    "torch/csrc/jit/runtime/register_c10_ops.cpp",
    "torch/csrc/jit/ir/subgraph_matcher.cpp",
    "torch/csrc/jit/runtime/symbolic_script.cpp",
    "torch/csrc/jit/runtime/profiling_graph_executor_impl.cpp",
    "torch/csrc/jit/runtime/profiling_record.cpp",
    "torch/csrc/jit/runtime/operator.cpp",
    "torch/csrc/jit/ir/alias_analysis.cpp",
    "torch/csrc/jit/passes/batch_mm.cpp",
    "torch/csrc/jit/passes/bailout_graph.cpp",
    "torch/csrc/jit/passes/canonicalize_ops.cpp",
    "torch/csrc/jit/passes/decompose_ops.cpp",
    "torch/csrc/jit/passes/canonicalize.cpp",
    "torch/csrc/jit/passes/clear_undefinedness.cpp",
    "torch/csrc/jit/passes/common_subexpression_elimination.cpp",
    "torch/csrc/jit/passes/constant_propagation.cpp",
    "torch/csrc/jit/passes/constant_pooling.cpp",
    "torch/csrc/jit/passes/create_autodiff_subgraphs.cpp",
    "torch/csrc/jit/passes/dead_code_elimination.cpp",
    "torch/csrc/jit/passes/erase_number_types.cpp",
    "torch/csrc/jit/passes/fixup_trace_scope_blocks.cpp",
    "torch/csrc/jit/passes/graph_fuser.cpp",
    "torch/csrc/jit/passes/guard_elimination.cpp",
    "torch/csrc/jit/passes/inline_autodiff_subgraphs.cpp",
    "torch/csrc/jit/passes/inliner.cpp",
    "torch/csrc/jit/passes/lift_closures.cpp",
    "torch/csrc/jit/passes/inline_forked_closures.cpp",
    "torch/csrc/jit/passes/inplace_check.cpp",
    "torch/csrc/jit/passes/insert_guards.cpp",
    "torch/csrc/jit/passes/liveness.cpp",
    "torch/csrc/jit/passes/loop_unrolling.cpp",
    "torch/csrc/jit/passes/lower_grad_of.cpp",
    "torch/csrc/jit/passes/lower_graph.cpp",
    "torch/csrc/jit/passes/lower_tuples.cpp",
    "torch/csrc/jit/passes/peephole.cpp",
    "torch/csrc/jit/serialization/python_print.cpp",
    "torch/csrc/jit/passes/quantization.cpp",
    "torch/csrc/jit/passes/fuse_linear.cpp",
    "torch/csrc/jit/passes/remove_expands.cpp",
    "torch/csrc/jit/passes/requires_grad_analysis.cpp",
    "torch/csrc/jit/passes/shape_analysis.cpp",
    "torch/csrc/jit/passes/specialize_autogradzero.cpp",
    "torch/csrc/jit/passes/subgraph_rewrite.cpp",
    "torch/csrc/jit/passes/tensorexpr_fuser.cpp",
    "torch/csrc/jit/passes/utils/subgraph_utils.cpp",
    "torch/csrc/jit/passes/utils/memory_dag.cpp",
    "torch/csrc/jit/runtime/print_handler.cpp",
    "torch/csrc/jit/runtime/register_prim_ops.cpp",
    "torch/csrc/jit/runtime/register_prim_ops_c10.cpp",
    "torch/csrc/jit/runtime/register_string_ops.cpp",
    "torch/csrc/jit/runtime/register_special_ops.cpp",
    "torch/csrc/jit/runtime/register_distributed_ops.cpp",
    "torch/csrc/jit/ir/scope.cpp",
    "torch/csrc/jit/frontend/ir_emitter.cpp",
    "torch/csrc/jit/frontend/edit_distance.cpp",
    "torch/csrc/jit/runtime/logging.cpp",
    "torch/csrc/jit/frontend/convert_to_ssa.cpp",
    "torch/csrc/jit/frontend/exit_transforms.cpp",
    "torch/csrc/jit/frontend/inline_loop_condition.cpp",
    "torch/csrc/jit/frontend/canonicalize_modified_loop.cpp",
    "torch/csrc/jit/frontend/script_type_parser.cpp",
    "torch/csrc/jit/frontend/sugared_value.cpp",
    "torch/csrc/jit/frontend/schema_matching.cpp",
    "torch/csrc/jit/ir/class_type.cpp",
    "torch/csrc/jit/frontend/parser.cpp",
    "torch/csrc/jit/runtime/jit_exception.cpp",
    "torch/csrc/jit/serialization/source_range_serialization.cpp",
    "torch/csrc/jit/testing/file_check.cpp",
    "torch/csrc/jit/serialization/import_source.cpp",
    "torch/csrc/jit/testing/hooks_for_testing.cpp",
    "torch/csrc/jit/frontend/builtin_functions.cpp",
    "torch/csrc/jit/api/module.cpp",
    "torch/csrc/jit/api/module_save.cpp",
    "torch/csrc/jit/api/object.cpp",
    "torch/csrc/jit/frontend/string_to_type.cpp",
    "torch/csrc/jit/frontend/tracer.cpp",
    "torch/csrc/jit/codegen/fuser/kernel_cache.cpp",
    "torch/csrc/jit/codegen/fuser/compiler.cpp",
    "torch/csrc/jit/codegen/fuser/executor.cpp",
    "torch/csrc/jit/codegen/fuser/codegen.cpp",
    "torch/csrc/jit/codegen/fuser/fallback.cpp",
    "torch/csrc/jit/codegen/fuser/cpu/fused_kernel.cpp",
    "torch/csrc/jit/codegen/fuser/interface.cpp",
    "torch/csrc/jit/api/function.cpp",
    "torch/csrc/jit/runtime/vararg_functions.cpp",
    "torch/csrc/jit/python/update_graph_executor_opt.cpp",
    "torch/csrc/jit/mobile/function.cpp",
    "torch/csrc/jit/mobile/import.cpp",
    "torch/csrc/jit/mobile/module.cpp",
    "torch/csrc/jit/mobile/register_mobile_ops.cpp",
    "torch/csrc/jit/mobile/interpreter.cpp",
    "torch/csrc/jit/mobile/type_parser.cpp",
    "torch/csrc/jit/tensorexpr/codegen.cpp",
    "torch/csrc/jit/tensorexpr/eval.cpp",
    "torch/csrc/jit/tensorexpr/expr.cpp",
    "torch/csrc/jit/tensorexpr/ir.cpp",
    "torch/csrc/jit/tensorexpr/ir_mutator.cpp",
    "torch/csrc/jit/tensorexpr/ir_printer.cpp",
    "torch/csrc/jit/tensorexpr/ir_visitor.cpp",
    "torch/csrc/jit/tensorexpr/mem_arena.cpp",
    "torch/csrc/jit/tensorexpr/types.cpp",
    "torch/csrc/jit/tensorexpr/unique_name_manager.cpp",
    "torch/csrc/utils/byte_order.cpp",
    "torch/csrc/utils/tensor_flatten.cpp",
    "torch/csrc/utils/variadic.cpp",
    "torch/csrc/jit/tensorexpr/codegen.cpp",
    "torch/csrc/jit/tensorexpr/eval.cpp",
    "torch/csrc/jit/tensorexpr/expr.cpp",
    "torch/csrc/jit/tensorexpr/ir.cpp",
    "torch/csrc/jit/tensorexpr/ir_mutator.cpp",
    "torch/csrc/jit/tensorexpr/ir_printer.cpp",
    "torch/csrc/jit/tensorexpr/ir_visitor.cpp",
    "torch/csrc/jit/tensorexpr/mem_arena.cpp",
    "torch/csrc/jit/tensorexpr/types.cpp",
    "torch/csrc/jit/tensorexpr/unique_name_manager.cpp",
]

libtorch_cuda_sources = [
    "torch/csrc/cuda/comm.cpp",
    "torch/csrc/cuda/nccl.cpp",
    "torch/csrc/jit/codegen/fuser/cuda/fused_kernel.cpp",
    "torch/csrc/autograd/profiler_cuda.cpp",
    "torch/csrc/autograd/functions/comm.cpp",
]

torch_cpp_srcs = [
    "torch/csrc/api/src/cuda.cpp",  # this just forwards stuff, no real CUDA
    "torch/csrc/api/src/data/datasets/mnist.cpp",
    "torch/csrc/api/src/data/samplers/distributed.cpp",
    "torch/csrc/api/src/data/samplers/random.cpp",
    "torch/csrc/api/src/data/samplers/sequential.cpp",
    "torch/csrc/api/src/data/samplers/stream.cpp",
    "torch/csrc/api/src/enum.cpp",
    "torch/csrc/api/src/jit.cpp",
    "torch/csrc/api/src/serialize.cpp",
    "torch/csrc/api/src/nn/init.cpp",
    "torch/csrc/api/src/nn/module.cpp",
    "torch/csrc/api/src/nn/modules/_functions.cpp",
    "torch/csrc/api/src/nn/modules/activation.cpp",
    "torch/csrc/api/src/nn/modules/batchnorm.cpp",
    "torch/csrc/api/src/nn/modules/normalization.cpp",
    "torch/csrc/api/src/nn/modules/instancenorm.cpp",
    "torch/csrc/api/src/nn/modules/conv.cpp",
    "torch/csrc/api/src/nn/modules/dropout.cpp",
    "torch/csrc/api/src/nn/modules/distance.cpp",
    "torch/csrc/api/src/nn/modules/embedding.cpp",
    "torch/csrc/api/src/nn/modules/fold.cpp",
    "torch/csrc/api/src/nn/modules/linear.cpp",
    "torch/csrc/api/src/nn/modules/loss.cpp",
    "torch/csrc/api/src/nn/modules/padding.cpp",
    "torch/csrc/api/src/nn/modules/pixelshuffle.cpp",
    "torch/csrc/api/src/nn/modules/pooling.cpp",
    "torch/csrc/api/src/nn/modules/rnn.cpp",
    "torch/csrc/api/src/nn/modules/upsampling.cpp",
    "torch/csrc/api/src/nn/modules/container/functional.cpp",
    "torch/csrc/api/src/nn/modules/container/named_any.cpp",
    "torch/csrc/api/src/nn/options/activation.cpp",
    "torch/csrc/api/src/nn/options/batchnorm.cpp",
    "torch/csrc/api/src/nn/options/conv.cpp",
    "torch/csrc/api/src/nn/options/dropout.cpp",
    "torch/csrc/api/src/nn/options/instancenorm.cpp",
    "torch/csrc/api/src/nn/options/linear.cpp",
    "torch/csrc/api/src/nn/options/normalization.cpp",
    "torch/csrc/api/src/nn/options/embedding.cpp",
    "torch/csrc/api/src/nn/options/padding.cpp",
    "torch/csrc/api/src/nn/options/pooling.cpp",
    "torch/csrc/api/src/nn/options/rnn.cpp",
    "torch/csrc/api/src/nn/options/vision.cpp",
    "torch/csrc/api/src/optim/adagrad.cpp",
    "torch/csrc/api/src/optim/adam.cpp",
    "torch/csrc/api/src/optim/lbfgs.cpp",
    "torch/csrc/api/src/optim/optimizer.cpp",
    "torch/csrc/api/src/optim/rmsprop.cpp",
    "torch/csrc/api/src/optim/serialize.cpp",
    "torch/csrc/api/src/optim/sgd.cpp",
    "torch/csrc/api/src/serialize/input-archive.cpp",
    "torch/csrc/api/src/serialize/output-archive.cpp",
]

libtorch_python_cuda_sources = [
    "torch/csrc/cuda/Event.cpp",
    "torch/csrc/cuda/Module.cpp",
    "torch/csrc/cuda/Storage.cpp",
    "torch/csrc/cuda/Stream.cpp",
    "torch/csrc/cuda/Tensor.cpp",
    "torch/csrc/cuda/python_comm.cpp",
    "torch/csrc/cuda/python_nccl.cpp",
    "torch/csrc/cuda/serialization.cpp",
    "torch/csrc/cuda/utils.cpp",
    "torch/csrc/distributed/c10d/ddp.cpp",
]

def add_torch_libs():
    r = {}

    torch_cpp_headers = {
        header[len("torch/csrc/api/include/torch/"):]: header
        for header in native.glob(["torch/csrc/api/include/**/*.h"])
    }

    torch_cpp_headers["script.h"] = "torch/script.h"

    libtorch_python_sources = [
        ":generate-code=python_functions.cpp",
        ":generate-code=python_nn_functions.cpp",
        ":generate-code=python_torch_functions.cpp",
        ":generate-code=python_variable_methods.cpp",
        "torch/csrc/CudaIPCTypes.cpp",
        "torch/csrc/DataLoader.cpp",
        "torch/csrc/Device.cpp",
        "torch/csrc/Dtype.cpp",
        "torch/csrc/DynamicTypes.cpp",
        "torch/csrc/Exceptions.cpp",
        "torch/csrc/Generator.cpp",
        "torch/csrc/Layout.cpp",
        "torch/csrc/MemoryFormat.cpp",
        "torch/csrc/QScheme.cpp",
        "torch/csrc/Module.cpp",
        "torch/csrc/PtrWrapper.cpp",
        "torch/csrc/python_dimname.cpp",
        "torch/csrc/Size.cpp",
        "torch/csrc/Storage.cpp",
        "torch/csrc/TypeInfo.cpp",
        "torch/csrc/api/src/python/init.cpp",
        "torch/csrc/autograd/functions/init.cpp",
        "torch/csrc/autograd/init.cpp",
        "torch/csrc/autograd/python_anomaly_mode.cpp",
        "torch/csrc/autograd/python_cpp_function.cpp",
        "torch/csrc/autograd/python_engine.cpp",
        "torch/csrc/autograd/python_function.cpp",
        "torch/csrc/autograd/python_hook.cpp",
        "torch/csrc/autograd/python_legacy_variable.cpp",
        "torch/csrc/autograd/python_variable.cpp",
        "torch/csrc/autograd/python_variable_indexing.cpp",
        "torch/csrc/distributed/autograd/init.cpp",
        "torch/csrc/distributed/c10d/comm.cpp",
        "torch/csrc/distributed/c10d/init.cpp",
        "torch/csrc/distributed/c10d/reducer.cpp",
        "torch/csrc/distributed/rpc/init.cpp",
        "torch/csrc/distributed/rpc/process_group_agent.cpp",
        "torch/csrc/distributed/rpc/py_rref.cpp",
        "torch/csrc/distributed/rpc/python_functions.cpp",
        "torch/csrc/distributed/rpc/python_rpc_handler.cpp",
        "torch/csrc/distributed/rpc/request_callback_impl.cpp",
        "torch/csrc/jit/python/init.cpp",
        "torch/csrc/jit/passes/inline_fork_wait.cpp",
        "torch/csrc/jit/passes/onnx.cpp",
        "torch/csrc/jit/passes/onnx/cast_all_constant_to_floating.cpp",
        "torch/csrc/jit/passes/onnx/constant_fold.cpp",
        "torch/csrc/jit/passes/onnx/fixup_onnx_conditionals.cpp",
        "torch/csrc/jit/passes/onnx/fixup_onnx_loop.cpp",
        "torch/csrc/jit/passes/onnx/helper.cpp",
        "torch/csrc/jit/passes/onnx/peephole.cpp",
        "torch/csrc/jit/passes/onnx/prepare_division_for_onnx.cpp",
        "torch/csrc/jit/passes/onnx/scalar_type_analysis.cpp",
        "torch/csrc/jit/passes/onnx/unpack_quantized_weights.cpp",
        "torch/csrc/jit/passes/onnx/prepare_inplace_ops_for_onnx.cpp",
        "torch/csrc/jit/passes/remove_inplace_ops.cpp",
        "torch/csrc/jit/passes/utils/check_alias_annotation.cpp",
        "torch/csrc/jit/python/python_arg_flatten.cpp",
        "torch/csrc/jit/python/python_custom_class.cpp",
        "torch/csrc/jit/python/python_interpreter.cpp",
        "torch/csrc/jit/python/python_ir.cpp",
        "torch/csrc/jit/python/python_tracer.cpp",
        "torch/csrc/jit/python/script_init.cpp",
        "torch/csrc/jit/frontend/concrete_module_type.cpp",
        "torch/csrc/jit/python/python_sugared_value.cpp",
        "torch/csrc/jit/python/python_tree_views.cpp",
        "torch/csrc/multiprocessing/init.cpp",
        "torch/csrc/onnx/init.cpp",
        "torch/csrc/serialization.cpp",
        "torch/csrc/tensor/python_tensor.cpp",
        "torch/csrc/utils/init.cpp",
        "torch/csrc/utils/throughput_benchmark.cpp",
        "torch/csrc/utils.cpp",
        "torch/csrc/utils/cuda_lazy_init.cpp",
        "torch/csrc/utils/invalid_arguments.cpp",
        "torch/csrc/utils/object_ptr.cpp",
        "torch/csrc/utils/python_arg_parser.cpp",
        "torch/csrc/utils/structseq.cpp",
        "torch/csrc/utils/tensor_apply.cpp",
        "torch/csrc/utils/tensor_dtypes.cpp",
        "torch/csrc/utils/tensor_layouts.cpp",
        "torch/csrc/utils/tensor_memoryformats.cpp",
        "torch/csrc/utils/tensor_qschemes.cpp",
        "torch/csrc/utils/tensor_list.cpp",
        "torch/csrc/utils/tensor_new.cpp",
        "torch/csrc/utils/tensor_numpy.cpp",
        "torch/csrc/utils/tensor_types.cpp",
        "test/cpp/jit/torch_python_test.cpp",
    ]

    libtorch_python_sources.extend(native.glob(["test/cpp/jit/test_*.cpp"]))

    compiler_flags_cpu = [
        "-DUSE_C10D",
        "-DUSE_DISTRIBUTED",
        "-DUSE_NUMPY",
        "-DUSE_SCALARS",
        "-DNO_CUDNN_DESTROY_HANDLE",
        "-DPYTORCH_ONNX_CAFFE2_BUNDLE",
        "-Wno-write-strings",
        "-Wno-format",
        "-Wno-strict-aliasing",
        "-Wno-non-virtual-dtor",
        "-Wno-shadow-compatible-local",
        "-Wno-empty-body",
    ]
    compiler_flags_cuda = [
        "-DUSE_CUDNN",
        "-DUSE_NCCL",
    ]
    common_flags = {
        "compiler_specific_flags": {
            "clang": [
                "-Wno-absolute-value",
                "-Wno-expansion-to-defined",
                "-Wno-pessimizing-move",
                "-Wno-return-type-c-linkage",
                "-Wno-unknown-pragmas",
            ],
        },
        "headers": native.glob(["torch/csrc/**/*.h", "torch/csrc/generic/*.cpp", "test/cpp/jit/*.h"]),
    }
    propagated_pp_flags = [
        "-Icaffe2",
        "-Icaffe2/torch/csrc/api/include",
        "-Icaffe2/torch/csrc",
        "-Icaffe2/torch/csrc/nn",
        "-Icaffe2/torch/lib",
        # T59288529: Temporary hack to support building from xplat.
        # Remove with a proper fix.
        "-Ifbcode/caffe2",
        "-Ifbcode/caffe2/torch/csrc/api/include",
        "-Ifbcode/caffe2/torch/csrc",
        "-Ifbcode/caffe2/torch/csrc/nn",
        "-Ifbcode/caffe2/torch/lib",
    ]

    cpp_library(
        name = "libtorch",
        srcs = libtorch_sources,
        link_whole = True,
        propagated_pp_flags = propagated_pp_flags,
        deps = [
            ":generated-autograd-headers",
            ":generated-autograd-headers-bare",
            ":generated-jit-headers",
            "//caffe2/aten:ATen-cpu",
            "//caffe2/caffe2:caffe2_cpu",
            "//caffe2/caffe2/quantization/server:dnnlowp_ops",
            "//caffe2/torch/lib/libshm:libshm",
        ],
        external_deps = [
            ("nanopb", None, "protobuf-nanopb"),
            ("protobuf", None),
        ],
        compiler_flags = compiler_flags_cpu,
        **common_flags
    )

    cpp_library(
        name = "libtorch_cuda",
        srcs = libtorch_cuda_sources,
        link_whole = True,
        # TODO: putting USE_CUDA in propagated_pp_flags is error-prone
        propagated_pp_flags = propagated_pp_flags + [
            "-DUSE_CUDA",
        ],
        deps = [
            ":generated-autograd-headers",
            ":generated-autograd-headers-bare",
            ":generated-jit-headers",
            ":libtorch",
            "//caffe2/aten:ATen",
            "//caffe2/aten:generated-aten-headers-cuda",
            "//caffe2/caffe2:caffe2_cpu",
            "//caffe2/caffe2:caffe2_gpu",
            "//caffe2/torch/lib/libshm:libshm",
        ],
        external_deps = [
            ("cudnn", None, "cudnn-lazy"),
            ("nccl", None, "nccl-lazy"),
            ("cuda", None, "nvToolsExt-lazy"),
            ("cuda", None, "nvrtc-lazy"),
            ("cuda", None, "nvrtc-builtins-lazy"),
        ],
        compiler_flags = compiler_flags_cpu + compiler_flags_cuda,
        **common_flags
    )

    # torch-cpp is still conditionally compiled based on USE_CUDA. Ideally we'd
    # separate it out as an additive library instead.
    gpu_library_selector(
        name = "torch-cpp",
        deps_cpu = [":torch-cpp-cpu"],
        deps_cuda = [":torch-cpp-cuda"],
        merge_cpu_deps = False,
    )

    # USE_CUDA flag is propagated through propagated_pp_flags on libtorch
    cpp_library(
        name = "torch-cpp-cuda",
        srcs = torch_cpp_srcs,
        headers = torch_cpp_headers,
        header_namespace = "torch",
        deps = [
            ":libtorch_cuda",
            "//caffe2/torch/fb/init:init",
        ],
        external_deps = [
            ("cuda", None, "cuda-lazy"),
            ("cudnn", None, "cudnn-lazy"),
        ],
    )

    cpp_library(
        name = "torch-cpp-cpu",
        srcs = torch_cpp_srcs,
        headers = torch_cpp_headers,
        header_namespace = "torch",
        deps = [
            ":libtorch",
            "//caffe2/torch/fb/init:init",
        ],
    )

    # _C_impl is still conditionally compiled based on USE_CUDA. Ideally we'd
    # separate it out as an additive library instead.
    # TODO: split it into cpp and cuda parts similarly to libtorch
    gpu_library_selector(
        name = "_C_impl",
        deps_cpu = [":_C_impl_cpu"],
        deps_cuda = [":_C_impl_cuda"],
        merge_cpu_deps = False,
    )

    cpp_library(
        name = "_C_impl_cpu",
        srcs = libtorch_python_sources,
        link_whole = True,
        deps = [
            ":torch-cpp-cpu",
            "//caffe2/torch/fb/init:init",
            "//caffe2/torch/lib/c10d:c10d_cpu",
            "//caffe2/torch/lib/libshm:libshm",
        ],
        external_deps = [
            ("numpy", None, "cpp"),
            ("pybind11", None),
            ("python", None),
        ],
        compiler_flags = compiler_flags_cpu,
        propagated_pp_flags = ["-DUSE_DISTRIBUTED"],
        **common_flags
    )

    cpp_library(
        name = "_C_impl_cuda",
        srcs = libtorch_python_sources + libtorch_python_cuda_sources,
        link_whole = True,
        deps = [
            ":torch-cpp-cuda",
            "//caffe2/torch/fb/init:init",
            "//caffe2/torch/lib/c10d:c10d",
            "//caffe2/torch/lib/libshm:libshm",
        ],
        external_deps = [
            ("numpy", None, "cpp"),
            ("pybind11", None),
            ("python", None),
        ],
        compiler_flags = compiler_flags_cpu + compiler_flags_cuda,
        propagated_pp_flags = ["-DUSE_DISTRIBUTED"],
        **common_flags
    )

    cpp_python_extension(
        name = "_C",
        srcs = [
            "torch/csrc/stub.cpp",
        ],
        base_module = "torch",
        deps = [":_C_impl"],
    )

    return r
