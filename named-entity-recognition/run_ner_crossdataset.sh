#!/bin/bash
export DATA_DIR=../datasets/NER/i2b2-2010/processed/merged
# export DATA_DIR=../datasets/NER/i2b2-2014/processed
# export DATA_DIR=../datasets/NER/BC5CDR-disease
# export LABEL_DIR=../datasets/NER/i2b2-2010/processed/merged
export LABEL_DIR=../datasets/NER/BC5CDR-disease
# export MODEL=dmis-lab/biobert-base-cased-v1.1
# export MODEL=emilyalsentzer/Bio_ClinicalBERT
# export MODEL=./output/i2b2-2010-lenient-Bio
export MODEL=./output/BC5CDR-disease-lenient-Bio
export OUTPUT_DIR=output/BC5CDR-i2b2-2010
export EPOCH=40
export CUDA_VISIBLE_DEVICES=1
export COMET_API_KEY=xxxxx

python run_ner_crossdataset.py \
    --data_dir $DATA_DIR \
    --labels_new ${DATA_DIR}/labels.txt \
    --labels ${LABEL_DIR}/labels.txt \
    --model_name_or_path $MODEL \
    --output_dir $OUTPUT_DIR \
    --evaluation_strategy steps \
    --eval_steps 300 \
    --max_seq_length 192 \
    --per_device_train_batch_size 64 \
    --num_train_epochs $EPOCH \
    --save_steps 1000 \
    --seed 1 \
    --do_train \
    --do_eval \
    --do_predict \
    --overwrite_output_dir