<?php

namespace App\Http\Controllers\Api\Content;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use App\Content;
use stdClass;

class IndexController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $data['terms_condition_title'] = Content::where('name', 'terms_condition_title')->first();
        $data['terms_condition_paragraph'] = Content::where('name', 'terms_condition_paragraph')->first();

        $data['about_us_title'] = Content::where('name', 'about_us_title')->first();
        $data['about_us_paragraph_a'] = Content::where('name', 'about_us_paragraph_a')->first();
        $data['about_us_paragraph_c'] = Content::where('name', 'about_us_paragraph_c')->first();
        $data['about_us_paragraph_b'] = Content::where('name', 'about_us_paragraph_b')->first();

        $data['help'][0]['id'] = 1;
        $data['help'][0]['question'] = Content::where('name', 'question_1')->first();
        $data['help'][0]['answer'] = Content::where('name', 'answer_1')->first();

        $data['help'][1]['id'] = 2;
        $data['help'][1]['question'] = Content::where('name', 'question_2')->first();
        $data['help'][1]['answer'] = Content::where('name', 'answer_2')->first();

        $data['help'][2]['id'] = 3;
        $data['help'][2]['question'] = Content::where('name', 'question_3')->first();
        $data['help'][2]['answer'] = Content::where('name', 'answer_3')->first();

        $data['help'][3]['id'] = 4;
        $data['help'][3]['question'] = Content::where('name', 'question_4')->first();
        $data['help'][3]['answer'] = Content::where('name', 'answer_4')->first();

        if ($data['terms_condition_title']) {
            $data['terms_condition_title'] = $data['terms_condition_title']->value;
        } else {
            $data['terms_condition_title'] = '';
        }

        if ($data['terms_condition_paragraph']) {
            $data['terms_condition_paragraph'] = $data['terms_condition_paragraph']->value;
        } else {
            $data['terms_condition_paragraph'] = '';
        }

        if ($data['about_us_title']) {
            $data['about_us_title'] = $data['about_us_title']->value;
        } else {
            $data['about_us_title'] = '';
        }

        if ($data['about_us_paragraph_a']) {
            $data['about_us_paragraph_a'] = $data['about_us_paragraph_a']->value;
        } else {
            $data['about_us_paragraph_a'] = '';
        }

        if ($data['about_us_paragraph_b']) {
            $data['about_us_paragraph_b'] = $data['about_us_paragraph_b']->value;
        } else {
            $data['about_us_paragraph_b'] = '';
        }

        if ($data['about_us_paragraph_c']) {
            $data['about_us_paragraph_c'] = $data['about_us_paragraph_c']->value;
        } else {
            $data['about_us_paragraph_c'] = '';
        }

        if ($data['help'][0]['question']) {
            $data['help'][0]['question'] = $data['help'][0]['question']->value;
        } else {
            $data['help'][0]['question'] = '';
        }

        if ($data['help'][0]['answer']) {
            $data['help'][0]['answer'] = $data['help'][0]['answer']->value;
        } else {
            $data['help'][0]['answer'] = '';
        }

        if ($data['help'][1]['question']) {
            $data['help'][1]['question'] = $data['help'][1]['question']->value;
        } else {
            $data['help'][1]['question'] = '';
        }

        if ($data['help'][1]['answer']) {
            $data['help'][1]['answer'] = $data['help'][1]['answer']->value;
        } else {
            $data['help'][1]['answer'] = '';
        }

        if ($data['help'][2]['question']) {
            $data['help'][2]['question'] = $data['help'][2]['question']->value;
        } else {
            $data['help'][2]['question'] = '';
        }

        if ($data['help'][2]['answer']) {
            $data['help'][2]['answer'] = $data['help'][2]['answer']->value;
        } else {
            $data['help'][2]['answer'] = '';
        }

        if ($data['help'][3]['question']) {
            $data['help'][3]['question'] = $data['help'][3]['question']->value;
        } else {
            $data['help'][3]['question'] = '';
        }

        if ($data['help'][3]['answer']) {
            $data['help'][3]['answer'] = $data['help'][3]['answer']->value;
        } else {
            $data['help'][3]['answer'] = '';
        }

        return response()->json([
            'status' => 1,
            'message' => 'Success',
            'data' => $data
        ]);
    }
}
