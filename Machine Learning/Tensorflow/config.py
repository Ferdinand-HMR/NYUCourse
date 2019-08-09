# coding=utf-8

sample_dir = "./256_new_ObjectCategories"
num_classes = 256
batch_size = 32
arch_model = "arch_inception_v4"
checkpoint_exclude_scopes = "Logits_out"
dropout_prob = 0.8
train_rate = 0.9
epoch = 100
learning_r_decay = True
learning_rate_base = 0.0001
decay_rate = 0.95
height, width = 299, 299
train_dir = 'model'
fine_tune = False
train_all_layers = True
checkpoint_path = 'pretrain/inception_v4.ckpt'
