'''
@author: zhichen
@date: 18, Dec, 2014

'''

DATA_PATH = "G:\KuaiPan\Project\BigDataContest\PredictScore\WorkSpace\data\\test\\"
IN_FILE = 'Score.txt'
OUT_FILE = 'ReScore.txt'

score = {}
with open(DATA_PATH + 'Score.txt', 'r') as score_file:
    is_first_line = True
    for line in score_file:
        if is_first_line:
            is_first_line = False
            pass
        else:
            record = line.strip('\n').split('\t')
            if record[1] not in score:
                score[record[1]] = [record[2]]
            else:
                score[record[1]].append(record[2])
print 'Read done.'

with open(DATA_PATH + OUT_FILE, 'w') as score_file:
    score_file.write('id,ses1,ses2,ses3\n')
    for k in score:
        score_file.write(k + ',' + score[k][0] + ',' + score[k][1] + ',' + 'NA' + '\n')

print 'Write done.'