<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Setting;
use App\Content;
use Auth;
use DB;
use App\updates;
class IndexController extends Controller
{
    public function index()
    {
    	$data['company_name'] = Setting::where('name', 'company_name')->first();
    	$data['email'] = Setting::where('name', 'email')->first();
    	$data['secondary_email'] = Setting::where('name', 'secondary_email')->first();
    	$data['contact_number'] = Setting::where('name', 'contact_number')->first();
    	$data['vat'] = Setting::where('name', 'vat')->first();
        $data['commission'] = Setting::where('name', 'commission')->first();
    	$data['whatsapp_number'] = Setting::where('name', 'whatsapp_number')->first();
        $data['address'] = Setting::where('name', 'address')->first();
    	$data['delivery_cost'] = Setting::where('name', 'delivery_cost')->first();

    	if ($data['company_name']) {
    		$data['company_name'] = $data['company_name']->value;
    	} else {
    		$data['company_name'] = '';
    	}

    	if ($data['email']) {
    		$data['email'] = $data['email']->value;
    	} else {
    		$data['email'] = '';
    	}

    	if ($data['secondary_email']) {
    		$data['secondary_email'] = $data['secondary_email']->value;
    	} else {
    		$data['secondary_email'] = '';
    	}

    	if ($data['contact_number']) {
    		$data['contact_number'] = $data['contact_number']->value;
    	} else {
    		$data['contact_number'] = '';
    	}

        if ($data['commission']) {
            $data['commission'] = $data['commission']->value;
        } else {
            $data['commission'] = '';
        }

    	if ($data['vat']) {
    		$data['vat'] = $data['vat']->value;
    	} else {
    		$data['vat'] = '';
    	}

    	if ($data['whatsapp_number']) {
    		$data['whatsapp_number'] = $data['whatsapp_number']->value;
    	} else {
    		$data['whatsapp_number'] = '';
    	}

    	if ($data['address']) {
    		$data['address'] = $data['address']->value;
    	} else {
    		$data['address'] = '';
    	}

        if ($data['delivery_cost']) {
            $data['delivery_cost'] = $data['delivery_cost']->value;
        } else {
            $data['delivery_cost'] = '';
        }

    	return view('admin.settings.index', compact('data'));
    }

    public function store(Request $request)
    {
        $this->validate(request(), [
            'email' => 'required',
            'contact_number' => 'required',
        ]);
        
        foreach($request->all() as $key => $row) {
            if($key != '_token') {
                $setting = Setting::where('name',$key)->update(['value' => $row, 'added_by' => \Auth::user()->id]);
                if(!$setting) {
                    Setting::create(['name' => $key, 'value' => $row, 'added_by' => \Auth::user()->id]);
                }
            }
        }
            
        Toastr::success('Setting has been Updated Successfully.', 'Success');
        return redirect()->back();
    }
}
