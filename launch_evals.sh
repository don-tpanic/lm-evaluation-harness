# pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93,peft=/datadrive1/brian/braingpt_finetuning/exp/finetune_llama2_chat_7b/checkpoint.0 \
# pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93 \

accelerate launch --num_processes=1 \
    -m lm_eval \
    --model hf \
    --model_args \
        pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93 \
    --tasks hellaswag \
    --log_samples \
    --output_path ken/output/llama2_chat_7b \
    --batch_size auto:4 \


# accelerate launch \
#     -m lm_eval \
#     --model hf \
#     --model_args \
#         pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93,peft=/datadrive1/finetuned_models/finetune_llama2_chat_7b/checkpoint.0 \
#     --tasks hellaswag,winogrande \
#     --log_samples \
#     --output_path output/finetune_llama2_chat_7b \
#     --batch_size auto:4

# hellaswag: common sense reasoning
# truthfulqa: reading comprehension
# squadv2: reading comprehension
# winogrande: commonsense reasoning
# (exclucded) triviaqa: world knowledge (exact match..)


# hf (pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93), gen_kwargs: (None), limit: None, num_fewshot: None, batch_size: auto:4 (64,64,64,64)
# |  Tasks  |Version|Filter|n-shot| Metric |Value |   |Stderr|
# |---------|-------|------|-----:|--------|-----:|---|-----:|
# |hellaswag|Yaml   |none  |     0|acc     |0.5779|±  |0.0049|
# |         |       |none  |     0|acc_norm|0.7551|±  |0.0043|
# hf (pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93,peft=/datadrive1/brian/braingpt_finetuning/exp/finetune_llama2_chat_7b/checkpoint.0), gen_kwargs: (None), limit: None, num_fewshot: None, batch_size: auto:4 (64,64,64,64)
# |  Tasks  |Version|Filter|n-shot| Metric |Value |   |Stderr|
# |---------|-------|------|-----:|--------|-----:|---|-----:|
# |hellaswag|Yaml   |none  |     0|acc     |0.5583|±  |0.0050|
# |         |       |none  |     0|acc_norm|0.7430|±  |0.0044|


# hf (pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93), gen_kwargs: (None), limit: None, num_fewshot: None, batch_size: auto:4
# | Tasks  |Version|     Filter      |n-shot|  Metric   |Value|   |Stderr|
# |--------|-------|-----------------|-----:|-----------|----:|---|-----:|
# |triviaqa|Yaml   |remove_whitespace|     0|exact_match|0.025|±  |0.0012|
# hf (pretrained=/datadrive1/ken/.cache/huggingface/hub/models--meta-llama--Llama-2-7b-chat-hf/snapshots/c1b0db933684edbfe29a06fa47eb19cc48025e93,peft=/datadrive1/brian/braingpt_finetuning/exp/finetune_llama2_chat_7b/checkpoint.0), gen_kwargs: (None), limit: None, num_fewshot: None, batch_size: auto:4
# | Tasks  |Version|     Filter      |n-shot|  Metric   |Value |   |Stderr|
# |--------|-------|-----------------|-----:|-----------|-----:|---|-----:|
# |triviaqa|Yaml   |remove_whitespace|     0|exact_match|0.0641|±  |0.0018|
