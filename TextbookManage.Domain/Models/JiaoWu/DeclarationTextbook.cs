﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TextbookManage.Domain.Models.JiaoWu
{
    /// <summary>
    /// 教材系统的用书申报
    /// </summary>
    public abstract class DeclarationTextbook : AggregateRoot
    {
        public DeclarationTextbook()
        {
            HadViewFeedback = false;
            ViewFeedbackDate = null;
        }

        #region 属性
        /// <summary>
        /// 申报ID
        /// </summary>
        //public Guid DeclarationId { get; set; }
        /// <summary>
        /// 订单ID
        /// </summary>
        public Guid Subscription_Id { get; set; }
        /// <summary>
        /// 是否已查看回告
        /// </summary>
        public bool HadViewFeedback { get; set; }
        /// <summary>
        /// 查看回告日期
        /// </summary>
        public DateTime? ViewFeedbackDate { get; set; }
        /// <summary>
        /// 所属订单
        /// </summary>
        public virtual Subscription Subscription { get; set; }

        #endregion

        #region 业务规则

        /// <summary>
        /// 获取回告状态
        /// </summary>
        /// <returns></returns>
        public FeedbackState FeedbackState
        {
            get
            {
                return Subscription.FeedbackState;
            }
        }


        /// <summary>
        /// 查看回告
        /// </summary>
        public void ViewFeedback()
        {
            //是否已查看过回告
            if (HadViewFeedback)
            {
                return;
            }
            else//未查看
            {
                //书商已给出回告
                if (FeedbackState == FeedbackState.征订成功 || FeedbackState == FeedbackState.征订失败)
                {
                    //修改已查看回告标志
                    HadViewFeedback = true;
                    //修改查看回告日期
                    ViewFeedbackDate = DateTime.Now;
                }
            }
        }

        #endregion

    }
}
