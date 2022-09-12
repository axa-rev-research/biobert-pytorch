# BioBERT for Named Entity Recognition

To train an NER model with BioBERT-v1.1 (base), run the command below.
Before training, please run `./preprocess.sh` to preprocess the datasets downloaded in `biobert-pytorch` (see [here](https://github.com/jhyuklee/biobert-pytorch)).

## Additional Requirements
- seqeval : Used for NER evaluation (`pip install seqeval`)

## Training
```bash
export SAVE_DIR=./output
export DATA_DIR=../datasets/NER

export MAX_LENGTH=192
export BATCH_SIZE=32
export NUM_EPOCHS=30
export SAVE_STEPS=1000
export ENTITY=NCBI-disease
export SEED=1

python run_ner.py \
    --data_dir ${DATA_DIR}/${ENTITY}/ \
    --labels ${DATA_DIR}/${ENTITY}/labels.txt \
    --model_name_or_path dmis-lab/biobert-base-cased-v1.1 \
    --output_dir ${SAVE_DIR}/${ENTITY} \
    --max_seq_length ${MAX_LENGTH} \
    --num_train_epochs ${NUM_EPOCHS} \
    --per_device_train_batch_size ${BATCH_SIZE} \
    --save_steps ${SAVE_STEPS} \
    --seed ${SEED} \
    --do_train \
    --do_eval \
    --do_predict \
    --overwrite_output_dir
```

## Benchmark Results

### NLP-healthcare

|         Task        |      DATA      |     AWS     |     Azure    |    Stanza    |   BioBERT (s/l)  |  ClinicalBERT  (s/l) |  Clinical+BioBERT  (s/l) |
|---------------------|----------------|:-----------:|:------------:|:------------:|:----------------:|:--------------------:|:------------------------:|
| Biomedical NER      | BC5CDR         |    71.50    |     78.90    |     91.50    |    80.36/83.03   |      79.44/82.90     |        79.09/82.46       |
| Clinical NER        | i2b2 2010      |    79.80    |     83.20    |     95.10    |    86.44/90.07   |      86.28/90.16     |        89.83/90.61       |
| PHI de-ID           | i2b2 2014      |    xxxxx    |     xxxxx    |     xxxxx    |    93.82/94.17   |      94.24/94.47     |        94.24/94.47       |

## Contact
For help or issues using BioBERT-PyTorch, please create an issue and tag [@minstar](https://github.com/minstar).
