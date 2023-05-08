#CUDA_VISIBLE_DEVICES="0,1,2,3" python learn.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ../checkpoints/small --ckpt_save_path ./ckpt/reinforce_correction/mwz21/small_dst --lr 1e-4 --epoch_num 15 --batch_size 16 --wandb_name small_dst_learn --dst
#CUDA_VISIBLE_DEVICES="0,1,2,3" python learn.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ../checkpoints/small --ckpt_save_path ./ckpt/reinforce_correction/mwz21/small_nlg --lr 1e-4 --epoch_num 15 --batch_size 16 --wandb_name small_dst_learn --nlg --weight_path ./ckpt/reinforce_correction/mwz21/small_dst
#python evaluation.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz21/small_nlg --mode nlg --batch_size 32
#python reinforce.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz21/small_dst --ckpt_save_path ./ckpt/reinforce_correction/mwz21/small_dst_reinforce --lr 1e-5 --epoch_num 10 --batch_size 32 --wandb_name small_dst_reinforce --mode dst --alpha 1.0
#python reinforce.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz21/small_nlg --ckpt_save_path ./ckpt/reinforce_correction/mwz21/small_nlg_reinforce --lr 1e-6 --epoch_num 3 --batch_size 4 --wandb_name small_nlg_reinforce --mode nlg --ref_model_path ./ckpt/reinforce_correction/mwz21/small_dst_reinforce --ref_task dst --alpha 0.5 --beta 0.7
#python evaluation.py --data_path_prefix ../data/multiwoz21 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz21/small_nlg_reinforce --mode nlg --batch_size 32
#python reinforce.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_dst --ckpt_save_path ./ckpt/reinforce_correction/mwz22/small_dst_reinforce --lr 1e-5 --epoch_num 10 --batch_size 32 --wandb_name small_dst_reinforce_mwz22 --mode dst --alpha 1.0
##python reinforce.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_nlg --ckpt_save_path ./ckpt/reinforce_correction/mwz22/small_nlg_reinforce --lr 1e-6 --epoch_num 3 --batch_size 4 --wandb_name small_nlg_reinforce_mwz22 --mode nlg --ref_model_path ./ckpt/reinforce_correction/mwz22/small_dst_reinforce --ref_task dst --alpha 0.5 --beta 0.7
#python evaluation.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_dst_reinforce --mode nlg --batch_size 64 --ref_model_path ./ckpt/reinforce_correction/mwz21/small_nlg_reinforce --ref_task nlg
#python evaluation.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_dst --mode dst --batch_size 64

python reinforce.py --data_path_prefix ../data/multiwoz22 --model_name t5-base --pretrained_path ./ckpt/nlg_mwz22 --ckpt_save_path ./ckpt/reinforce_correction/mwz22/base_nlg_reinforce --lr 1e-7 --epoch_num 3 --batch_size 4 --wandb_name base_nlg_reinforce_mwz22_lr6 --mode nlg --ref_model_path ./ckpt/reinforce_correction/mwz22/alpha1.0 --ref_task dst --alpha 1.0 --beta 0.7
python evaluation.py --data_path_prefix ../data/multiwoz22 --model_name t5-base --pretrained_path ./ckpt/reinforce_correction/mwz22/base_nlg_reinforce --mode nlg --batch_size 32

CUDA_VISIBLE_DEVICES="0,1,2,3" python learn.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ../checkpoints/small --ckpt_save_path ./ckpt/reinforce_correction/mwz22/small_nlg --lr 1e-4 --epoch_num 15 --batch_size 16 --wandb_name small_nlg_mwz22_learn --nlg --weight_path ./ckpt/reinforce_correction/mwz22/small_dst
python reinforce.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_nlg --lr 1e-7 --epoch_num 3 --batch_size 4 --ref_model_path ./ckpt/reinforce_correction/mwz22/small_dst_reinforce --ref_task dst --alpha 0.5 --beta 0.7 --ckpt_save_path ./ckpt/reinforce_correction/mwz22/small_nlg_reinforce --wandb_name small_nlg_reinforce_mwz22_lr7
python evaluation.py --data_path_prefix ../data/multiwoz22 --model_name t5-small --pretrained_path ./ckpt/reinforce_correction/mwz22/small_nlg_reinforce --mode nlg --batch_size 64